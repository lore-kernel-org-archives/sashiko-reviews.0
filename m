Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F662F83A2
	for <sashiko-reviews@lists.linux.dev>; Wed, 15 Jul 2026 15:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784130783; cv=none; b=Mlyzue2guPFgGChep1JXWLsadEgEEoUnDhvMNwpm2Xy8UT1ImzUSltX6DoDh6+ExmAueHGe4bSF1bqTijrmBsMRGWfZ1fHVnaTN2c9rGF4LbE2uOxHAIo9ufGDBXLfiVZpD/l+WWCxaMOqwt92PlCsIys7ZVeJNLk8BgkgXHw/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784130783; c=relaxed/simple;
	bh=GfL7ScdV+sKGgIZsFbGqoAbtvxgQ5T0RXVKDO0kSQKE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qOG1S3ou9Eor0ZNxt0OWfSr70Huy4hYC1GdFuXfuzdhNMVV3BW5WOBcaZn023Wn1zXz+P9AiQfDatscWuCntoJWHCQYpB68D7O+M0R14eYx8kBc1VHsYl3Rf+mHcOEP5oFXM+FoflU33Y/z2XxdYuiHxHQ1piXIcNG46Q88feMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GS4eQlIW; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GS4eQlIW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784130781;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kMiIZgsKIRmPEnfnhSzNdV3FraxgXqYSzG7g1i+zcd4=;
	b=GS4eQlIWH4HTxjElakrErCu/Pkj4rzi5MZePKojlAH56SFg3Tiq5Yl0vu2CoeFm3KK2ACT
	U89pStM8coosFy8qvvzH6yIp9YVjvZb/Az7HarsqMHb50kqyt7UfeH/85SqvxoUUizOjI/
	hAFAcuxxRt5y11O+4m4pHqswxGYWZGw=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-570-nE-VLrzAOd-VNAq3YD4Ecg-1; Wed,
 15 Jul 2026 11:52:59 -0400
X-MC-Unique: nE-VLrzAOd-VNAq3YD4Ecg-1
X-Mimecast-MFC-AGG-ID: nE-VLrzAOd-VNAq3YD4Ecg_1784130778
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DD0821956063;
	Wed, 15 Jul 2026 15:52:57 +0000 (UTC)
Received: from [10.22.89.72] (unknown [10.22.89.72])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0CFE61800576;
	Wed, 15 Jul 2026 15:52:56 +0000 (UTC)
Message-ID: <0ce94f28-6a9c-4937-9e7d-622dcd271295@redhat.com>
Date: Wed, 15 Jul 2026 11:52:56 -0400
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] selftests/cgroup: Fix intermittent
 test_cgfreezer_ptrace test failures
To: sashiko-reviews@lists.linux.dev
Cc: hannes@cmpxchg.org, mkoutny@suse.com, tj@kernel.org
References: <20260715035446.565625-1-longman@redhat.com>
 <20260715040324.0079F1F000E9@smtp.kernel.org>
From: Waiman Long <longman@redhat.com>
In-Reply-To: <20260715040324.0079F1F000E9@smtp.kernel.org>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xbcT9kjKq_KBLWRGCLJwj3iDIo9B10ORLWPIFWSeVyA_1784130778
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/15/26 12:03 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The retry loop using `cg_wait_for()` spins instantaneously instead of waiting, because `cg_wait_for()` does not consume inotify events.
> --
>
> --- Patch [1]: [PATCH v2] selftests/cgroup: Fix intermittent test_cgfreezer_ptrace test failures ---
> commit 4e3a44a10c22322bc0c2be4b1ba1540164054d05
> Author: Waiman Long <longman@redhat.com>
>
> selftests/cgroup: Fix intermittent test_cgfreezer_ptrace test failures
>
> This commit addresses intermittent failures in the test_cgfreezer_ptrace
> test on certain architectures by adding logic to wait for the cgroup frozen
> state. It introduces a retry loop using cg_prepare_for_wait() and
> cg_wait_for() helpers instead of failing immediately if the cgroup isn't
> frozen yet.
>
>> diff --git a/tools/testing/selftests/cgroup/test_freezer.c b/tools/testing/selftests/cgroup/test_freezer.c
>> index 0569e93fa6b00..9edb2d34658c7 100644
>> --- a/tools/testing/selftests/cgroup/test_freezer.c
>> +++ b/tools/testing/selftests/cgroup/test_freezer.c
> [ ... ]
>
>> @@ -622,15 +625,47 @@ static int test_cgfreezer_ptrace(const char *root)
>>   	if (ptrace(PTRACE_GETSIGINFO, pid, NULL, &siginfo))
>>   		goto cleanup;
>>   
>> +	/*
>> +	 * The ptrace(PTRACE_DETACH) call spawns a different a process to
>> +	 * temporarily unfreeze the cgroup and then freeze it again in the
>> +	 * detaching process. The reading of the frozen flag from cgroup.events
>> +	 * is done by the main test process running probably on a different CPU.
>> +	 * As a result, racing is possible and the intermediate unfrozen state
>> +	 * can be read leading to occasional test failure especially on
>> +	 * architectures with a weak memory model like arm64.
>> +	 *
>> +	 * This intermittent test failure can be avoided by using the
>> +	 * cg_prepare_for_wait() and cg_wait_for() helpers to wait for change
>> +	 * in the frozen state if necessary.
>> +	 */
>> +	fd = cg_prepare_for_wait(cgroup);
>> +	if (fd < 0)
>> +		goto cleanup;
>> +
>>   	if (ptrace(PTRACE_DETACH, pid, NULL, NULL))
>>   		goto cleanup;
>>   
>> -	if (cg_check_frozen(cgroup, true))
>> +	suppress_debug_msg = true;
>> +	frozen = !cg_check_frozen(cgroup, true);
>> +	if (!frozen) {
>> +		/* Attempt to wait until frozen */
>> +		for (retries = 0; retries < 3; retries++) {
>> +			if (cg_wait_for(fd))
> [Severity: Medium]
> Can this loop turn into a fast spin-loop without actually waiting?
>
> Looking at cg_wait_for() in tools/testing/selftests/cgroup/lib/cgroup_util.c:
>
>      if (ret > 0 && fds.revents & POLLIN) {
>          ret = 0;
>          break;
>      }
>
> It checks for POLLIN but does not call read() to consume the inotify event.
>
> If an intermediate event (like the cgroup temporarily unfreezing) triggers
> POLLIN, won't subsequent calls to cg_wait_for() see the file descriptor as
> continuously readable and return instantly?
>
> This would cause the retries to execute without any delay, failing to wait
> for the actual frozen state.

That is not true. cg_check_frozen() will read from cgroup.events 
consuming the inotify event.

Cheers,
Longman

>
>> +				break;
>> +			frozen = !cg_check_frozen(cgroup, true);
>> +			if (frozen)
>> +				break;
>> +		}
>> +	}

