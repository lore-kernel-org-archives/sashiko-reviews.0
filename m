Received: from mta0.migadu.com (out-245.mta0.migadu.com [91.218.175.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B70E481641
	for <sashiko-reviews@lists.linux.dev>; Thu, 13 Aug 2026 14:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786631097; cv=none; b=qEDyNp0V/s1jT9OBbWQ8e2c2i2CNIpk2F6y7TmsWHWbBMqUMqUOqw50O33YSBZEHDI3nFzvNm7UeqmXcONpvy59GkCSjKREKc+mwn9a6IyamVYbmsdM5bBgQJTYDtCy9Wqa+5E9J7z8DuWmMs9k/TeCshuxxZTIh9MxTWJR+Gng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786631097; c=relaxed/simple;
	bh=0dFH5UTN8j9+CyRG1lB9zZ6dooQJ9bl8CN1nTdqle/0=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=XkErFr327K4oZYKxPyyqC7j3Riob/RZgez5Y6OeobI+uaA2Xpo0L/IqF8KOEINFsPoSaIOVK+gKCiakruEpTkucO/L58GmxNbumDVjaO+kOe2cW7aVyJcfliR2pgcINe54xk+hqByIV+tWAeoDSYO7fF5aCmxfPkEoIAxUIXWnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=VsTc8RDd; arc=none smtp.client-ip=91.218.175.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="VsTc8RDd"
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=0dFH5UTN8j9+CyRG1lB9zZ6dooQJ9bl8CN1nTdqle/0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1786631093; v=1; x=1787235893;
 b=VsTc8RDdruaNib+kZFs6YaNQVJOJspD7P/xgp8Ousfpd482JyAnzulqrCgvPDxdhMfUTBSTY
 sw+IzttNATnLrcgImtpkdlbFW1H5/iqVBGerEnZCuoa9w7c9MrEchFRUKd0b64UGQaccAwAO5nn
 q3Wah2R+P6TS0aoe94ximAFM=
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: from [192.168.1.116] (111.162.215.50)
	by smtp.migadu.com with ESMTPS id 047ef3b105610436;
	Thu, 13 Aug 2026 14:24:53 +0000
X-Migadu-Flow: FLOW_OUT
Message-ID: <6f547663-beac-4ee8-9a5e-7f681d979d85@linux.dev>
Date: Thu, 13 Aug 2026 22:24:49 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: cui.tao@linux.dev, mkoutny@suse.com, tj@kernel.org, hannes@cmpxchg.org
Subject: Re: [PATCH v3] selftests/cgroup: add PSI pressure trigger and
 validation tests
To: sashiko-reviews@lists.linux.dev
References: <20260813133723.1663605-1-cui.tao@linux.dev>
 <20260813135418.D34F31F000E9@smtp.kernel.org>
From: Tao Cui <cui.tao@linux.dev>
In-Reply-To: <20260813135418.D34F31F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



在 2026/8/13 21:54, sashiko-bot@kernel.org 写道:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The child processes spawned to generate CPU pressure execute an unconditional infinite loop (`for (;;);`). If the test is interrupted (e.g., via SIGINT or a CI timeout sending SIGTERM), the parent process will exit immediately without executing the cleanup block (`cg_killall()`). This leaves `ncpus + 1` child processes running forever, consuming 100% CPU on all cores and effectively locking up the system.
> --
> 
> --- Patch [1]: [PATCH v3] selftests/cgroup: add PSI pressure trigger and validation tests ---
> commit a3c72bd52fb11f36beba6ee125a9c7100e986a5a
> Author: Tao Cui <cuitao@kylinos.cn>
> selftests/cgroup: add PSI pressure trigger and validation tests
> 
> This commit adds per-resource trigger smoke tests, a cgroup.pressure
> hide/show toggle test, and a CPU-pressure trigger test using
> over-subscription to the cgroup selftests.
> 
> Link: https://lore.kernel.org/all/20260724025826.504586-1-cui.tao@linux.dev/
> Link: https://lore.kernel.org/all/20260728083742.2359320-1-cui.tao@linux.dev/
> 
>> diff --git a/tools/testing/selftests/cgroup/test_psi.c b/tools/testing/selftests/cgroup/test_psi.c
>> new file mode 100644
>> index 0000000000000..cfb412f614588
>> --- /dev/null
>> +++ b/tools/testing/selftests/cgroup/test_psi.c
> [ ... ]
>> +/* A child that burns CPU forever; stopped by cg_killall() in the parent. */
>> +static int hog_cpu(const char *cgroup, void *arg)
>> +{
>> +	for (;;)
>> +		;
> 
> [Severity: Medium]
> Will this leave runaway CPU hogs consuming 100% CPU on all cores if the test
> is interrupted?
> 
> If the parent process is interrupted by a signal (like SIGINT or a CI runner
> timeout sending SIGTERM) while waiting for poll(), it will exit immediately
> without executing the cg_killall() cleanup block.
> 
> Could a fallback termination condition be added here, such as
> prctl(PR_SET_PDEATHSIG, SIGKILL) or checking getppid(), to prevent orphaned
> processes from locking up the system?
>
Agreed. The hogs run forever, so interrupting the parent during poll()
skips cg_killall() and orphans them. I'll add prctl(PR_SET_PDEATHSIG,
SIGKILL) at the start of each hog so the kernel reaps them if the
parent dies -- for v4.
 
>> +	return 0;
>> +}
> 

