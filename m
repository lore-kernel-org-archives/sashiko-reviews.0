Received: from mta1.migadu.com (out-17.mta1.migadu.com [95.215.58.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3CC544F570
	for <sashiko-reviews@lists.linux.dev>; Thu, 24 Sep 2026 20:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790283268; cv=none; b=P65CXAGCtbTkjnaw2MR7fHwHG6ZbPA0bA+ki1B90bICAa6JxAinIb7/IcjSK7OQflCW9LCxXvux1PLtpDtbs1aBEiSwSOQwiUo7xjCVS9iV2e7Wu8Z5NW5HQSvAfw17Spqg2OfYmrIL3Pwtuo7rsJGdQeutkU7r/WsS90Z6yEc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790283268; c=relaxed/simple;
	bh=aXzhg2/sV7JxsC85KbccWxXfTEzFGBgAsvIphQGs6vE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ayZdFW+HxVIy9wk1L/l0EmL9tcX5Wz25U569Tv0QP41BFsExeFCz5KPfXqr6DKBykuV1P0eNS/9+q7LQ8LiXxuXV/qvvGZAUlJV0INrwndk1I7xXHzzf0HyNVjGPZ6twHtYfoYanz1ocKHpHrpwMGMOeEKjHctwGBK0kwNwFTdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Oy4t935U; arc=none smtp.client-ip=95.215.58.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Oy4t935U"
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=aXzhg2/sV7JxsC85KbccWxXfTEzFGBgAsvIphQGs6vE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790283263; v=1; x=1790888063;
 b=Oy4t935UgkLajmiKSOEpOR5CxzTtcgq+YWCv/KKZ90J6rrz3h3oCVKwL0nwHrEYf9p6J+Z8k
 rU0qB+JxvrT4gBVvsKI2SB2lrZNihl34CKhIyYcyYEO4RGj4J9LGcZ0o4YStxbmhCS4ochMVOdr
 /MHzZQ37Yd4wnFztU7aYfC0s=
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 96f419482a6f5d26;
	Thu, 24 Sep 2026 20:54:23 +0000
X-Mizu-Trace-ID: 96f419482a6f5d26
X-Migadu-Flow: FLOW_OUT
Message-ID: <75d4a3bb-dbec-42ba-868b-8117de405d3b@linux.dev>
Date: Thu, 24 Sep 2026 13:54:20 -0700
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH vfs v1] bpf: Allow bpf_d_path() from filp_close_sync()
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
References: <20260924204226.190315-1-ihor.solodrai@linux.dev>
 <20260924205218.04C4B1F000FF@smtp.kernel.org>
Content-Language: en-US
From: Ihor Solodrai <ihor.solodrai@linux.dev>
In-Reply-To: <20260924205218.04C4B1F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/24/26 1:52 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] bpf: missing filp_close_sync dependency breaks resolve_btfids and selftest
> - [Low] bpf: failure to migrate CHECK() to ASSERT_*() when updating selftest
> --
> 
> commit f620a29b55750df4341321e76f9065c834f91fa3
> Author: Ihor Solodrai <ihor.solodrai@linux.dev>
> 
> bpf: Allow bpf_d_path() from filp_close_sync()
> 
> The d_path selftest closes its descriptors with close_range() so that
> its fentry program on filp_close() runs. The vfs commit
> 46ace7e4dc4b ("fs: make close_range() synchronous") switched
> close_range() to filp_close_sync(), so the program still attaches but
> is never called. This commit allows bpf_d_path() from filp_close_sync()
> and updates the selftest.
> 
>> diff --git a/kernel/trace/bpf_trace.c b/kernel/trace/bpf_trace.c
>> index 29260951aa871..09a27810ca27f 100644
>> --- a/kernel/trace/bpf_trace.c
>> +++ b/kernel/trace/bpf_trace.c
>> @@ -972,6 +972,7 @@ BTF_ID(func, vfs_fallocate)
>>  BTF_ID(func, dentry_open)
>>  BTF_ID(func, vfs_getattr)
>>  BTF_ID(func, filp_close)
>> +BTF_ID(func, filp_close_sync)
> 
> [Severity: High]
> Does filp_close_sync exist in the current tree? Since the referenced VFS commit
> (46ace7e4dc4b) might not be present yet, adding its BTF ID here will break the
> kernel build during resolve_btfids due to a missing dependency.

The patch obviously depends on 46ace7e4dc4b ("fs: make close_range() synchronous")
being in the tree.

> 
> [ ... ]
> 
>> diff --git a/tools/testing/selftests/bpf/prog_tests/d_path.c b/tools/testing/selftests/bpf/prog_tests/d_path.c
>> index 1a2a2f1abf033..7665e1d28a641 100644
>> --- a/tools/testing/selftests/bpf/prog_tests/d_path.c
>> +++ b/tools/testing/selftests/bpf/prog_tests/d_path.c
> [ ... ]
>> @@ -165,7 +166,7 @@ static void test_d_path_basic(void)
>>  
>>  	if (CHECK(!bss->called_close,
>>  		  "close",
>> -		  "trampoline for filp_close was not called\n"))
>> +		  "trampoline for filp_close_sync was not called\n"))
> 
> [Severity: Low]
> Since this CHECK() macro in test_d_path_basic() is being modified, shouldn't
> it be migrated to the modern ASSERT_*() macros? BPF subsystem guidelines require
> replacing deprecated CHECK() macros when updating existing tests.

That's a selftests/bpf nit, not relevant to the issue addressed by the patch.

> 
>>  		goto cleanup;
>>  
>>  	for (int i = 0; i < MAX_FILES; i++) {
> 
> [ ... ]
> 
>> diff --git a/tools/testing/selftests/bpf/progs/test_d_path.c b/tools/testing/selftests/bpf/progs/test_d_path.c
>> index 561b2f861808e..edb5494a47f74 100644
>> --- a/tools/testing/selftests/bpf/progs/test_d_path.c
>> +++ b/tools/testing/selftests/bpf/progs/test_d_path.c
>> @@ -41,7 +41,7 @@ int BPF_PROG(prog_stat, struct path *path, struct kstat *stat,
>>  	return 0;
>>  }
>>  
>> -SEC("fentry/filp_close")
>> +SEC("fentry/filp_close_sync")
> 
> [Severity: High]
> Will the test load fail unconditionally here? Attaching a BPF program to
> fentry/filp_close_sync when the function doesn't yet exist in the tree will
> cause an error. Applying this patch without its VFS dependency introduces a
> cross-tree dependency failure regression.

See above.

> 
>>  int BPF_PROG(prog_close, struct file *file, void *id)
>>  {
>>  	pid_t pid = bpf_get_current_pid_tgid() >> 32;
> 

