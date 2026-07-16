Received: from out203-205-221-192.mail.qq.com (out203-205-221-192.mail.qq.com [203.205.221.192])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B993DF002
	for <sashiko-reviews@lists.linux.dev>; Thu, 16 Jul 2026 08:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.192
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784191226; cv=none; b=WCHZ9EepAeUptm3ErcAWEoqkJXle6FrE6dOfB7WoKnjeyTgW4vvdTKuoIko0FIPx+146lfxe7mz2e/k3HDSzDmnqjSK5QNgxAUJ/yHlmXI8qrSMXO7t/n16ikWJDXcau6YgID6Eq6+oEwIVTQXSmXUZJYehqF8nYexlJecoiW9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784191226; c=relaxed/simple;
	bh=x2bQJ7vfupd36anNgI86CIztM7aj/1OzOlOjAoooFSI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FjDPxFh+1JfRBwoMcU2hV3Rbc8oZtnRwXXAzty5X8GKEdnV5CuU3Nk7pSugsP2wnmE34TBFC8MZgn3yAB6J9pYBuDQ2hUTQ/7M5xEAMSJfma3XkdEhxDFqOmv9zalP5kG8CcklmX8JIKUYKO+pyD4TeE2f4cO/LOsUVlyOcytVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=T6Mxq6Pd; arc=none smtp.client-ip=203.205.221.192
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="T6Mxq6Pd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1784191221;
	bh=WkeEU9gbBbAhKaoVq8Px2vG3HlKEpMx6/DAQ8mAJqfI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=T6Mxq6Pd5Ki7qZ5M0wNlCVrRSEOZRvlLae8SxYc2f5itzRj3mPMIzJ4BB2ZQEZ5SO
	 9SULLK2r7RYuh7ZVsPEjfQ7N3A8j8EC9pWu4uDdYc99eoZ5iZQYuywkG6S3nVSFPgV
	 yfXDTXg2Y1Xz1K5t+D93nbTEX3NAaJ16YfdgNXsE=
Received: from [10.56.52.25] ([39.156.73.14])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id 9C9216DA; Thu, 16 Jul 2026 16:39:09 +0800
X-QQ-mid: xmsmtpt1784191149tl4vgbkl2
Message-ID: <tencent_93F2525405E17565340D71CA005A482C6B05@qq.com>
X-QQ-XMAILINFO: NwU6Bou9okj/YUfiKeZ/EUpwxIzIK8n26/Z3RJkzrNM3M9hq8yIvbzlbUgX1uy
	 IPpKxNnMlW+r8BNC9Y2m1D1KoEXrLV/Riq/ipXkqWJ+FOwDngI2qhaUWpanYyCOPnqZC9oaURYoU
	 70eUmJ38xO62s8qsxe0CwNsJuVUFhnSaDpSgedMadDY2rjaKV/oTNa8LUHUehYBLX8ULE+NGoZaq
	 reVnByMEVl1NroZPI+yOxrrMCHQhCFy/oQh+FAYpd7tp6bLxEOknRUkWkEVpxtiI40/t02ebE6U5
	 ucyx1JtXIt1okk20fkYy4GtmSz0+w/nW9nl9WaMwOSx/A4z6GEcBVF2bKz/yi+jKSsUgKiQBtRJq
	 /HiocMhv0QeFLTwQ0CB0Fi+d40xd44U0P8032iks7FD4UXgzhZjdw1mJwYl1qtwihH/ueoK9AubZ
	 gsS0JGM9Zlxt722711J5KgT1nhJYjb5YeTcYAnJIzRtbCGSBc5nwFYsCHwu2QaRpYZPKS87VwrOe
	 T2hJLxsdLAu82mpf+MdXRtpbxg4vE06/L1N0yaG6xXMgY2slqQP9zLSodXYQLWpqlrXupxEfE16N
	 6x1FCHcAhcEntycK1T4vlZ77hcum0bEdGPM1yc/LrdMKvpn9p4ISZA2cxvoNWDf3MQ4GqIbLbEm+
	 PLReuaXunTX1Vs7w4Z9mHPWwp9Bj5ucSK8fdYcyy6+65CSTFpNfY1nrMPd9jmMs9q72+XhIbm9hD
	 ymrhl7MYqf05EZcTGharHPoxF2TVs+zn3JRDNRZ1vvP8yo+gZw5ZCGRo9YYTsyP0kYiQwNK8FISO
	 qDHsbu1MehKqB8r5mXxSpk9YUwthM8wU+ZbC6qX8xR8KzeEaV6PjJkQJfRryge2ddMhPVdnOGtVP
	 xdXMh2BJ3GJ71Zsv4FPSLGhCZGKtbQZTnO94AojnJo/E8VzOZ6e8c8MfSEApDFQyo6/+STs4tQaq
	 /ZWgWSS+i2i8Xa0KliEb6SRc61v7VM3423JIMsiDdzR9wOEg0hk7CqSXcJ2Kc+Rn25uiS6mNUF1E
	 Z61JevM1GVoe5dDeQXnTuUM/5YpJk2yLLr3rOkyw==
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-OQ-MSGID: <b2ea354e-cdbd-4b21-a9cb-3f6389e847e2@foxmail.com>
Date: Thu, 16 Jul 2026 16:39:08 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v2 2/2] selftests/bpf: Test
 bpf_strcat,bpf_strncat kfuncs
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
References: <cover.1784078494.git.rtoax@foxmail.com>
 <tencent_DB0510330C3A8574B3C62E6154165FCB4709@qq.com>
 <20260715014256.15E721F000E9@smtp.kernel.org>
Content-Language: en-US
From: Rong Tao <rtoax@foxmail.com>
In-Reply-To: <20260715014256.15E721F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/15/26 09:42, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
>
> New issues:
> - [Medium] The selftest `test_strncat_success` unconditionally fails because it incorrectly expects a return value of 13, assuming the global buffer retains state across subtests.
> - [Medium] Six failure tests for `strcat` and `strncat` will fail to load in the verifier because they pass invalid scalars (`NULL`, `1`, `-1`) to the strictly typed `dst` memory pointer argument.
>
> Pre-existing issues:
> - [High] The `__bpf_strncat` kfunc unconditionally performs an out-of-bounds read of the source string to check for truncation, erroneously returning `-EFAULT` on perfectly valid memory.
> --
>
> --- Patch [2]: [PATCH bpf-next v2 2/2] selftests/bpf: Test bpf_strcat,bpf_strncat kfuncs ---
> commit a3847dce2f7db636af75a6ec747d26e7cc1b00dd
> Author: Rong Tao <rongtao@cestc.cn>
>
> selftests/bpf: Test bpf_strcat,bpf_strncat kfuncs
>
> Add tests for new kfuncs bpf_strcat() and bpf_strncat().
>
>> diff --git a/tools/testing/selftests/bpf/progs/string_kfuncs_failure1.c b/tools/testing/selftests/bpf/progs/string_kfuncs_failure1.c
>> index bddc4e8579d24..29bc7eabbb6aa 100644
>> --- a/tools/testing/selftests/bpf/progs/string_kfuncs_failure1.c
>> +++ b/tools/testing/selftests/bpf/progs/string_kfuncs_failure1.c
> [ ... ]
>> @@ -53,6 +54,10 @@ SEC("syscall")  __retval(USER_PTR_ERR)int test_strnstr_null1(void *ctx) { return
>>   SEC("syscall")  __retval(USER_PTR_ERR)int test_strnstr_null2(void *ctx) { return bpf_strnstr("hello", NULL, 1); }
>>   SEC("syscall")  __retval(USER_PTR_ERR)int test_strncasestr_null1(void *ctx) { return bpf_strncasestr(NULL, "hello", 1); }
>>   SEC("syscall")  __retval(USER_PTR_ERR)int test_strncasestr_null2(void *ctx) { return bpf_strncasestr("hello", NULL, 1); }
>> +SEC("syscall")  __retval(USER_PTR_ERR)int test_strcat_null1(void *ctx) { return bpf_strcat(NULL, 6, "hello"); }
> [Severity: Medium]
> Will this test, along with test_strcat_user_ptr1 and test_strcat_pagefault1
> added below, fail to load in the verifier?
>
> Because the dst argument in bpf_strcat() lacks the __ign suffix, the verifier
> strictly checks it as a KF_ARG_PTR_TO_MEM_SIZE. Passing NULL or scalar values
> like 1 or -1 causes load-time rejection with -EACCES.
>
> Since the __retval(...) annotation expects a successful load followed by a
> runtime error, will these tests cause the test runner to abort with an
> unexpected load failure?
>
>> +SEC("syscall")  __retval(USER_PTR_ERR)int test_strcat_null2(void *ctx) { return bpf_strcat(kern_buf, sizeof(kern_buf), NULL); }
>> +SEC("syscall")  __retval(USER_PTR_ERR)int test_strncat_null1(void *ctx) { return bpf_strncat(NULL, 6, "hello", 2); }
>> +SEC("syscall")  __retval(USER_PTR_ERR)int test_strncat_null2(void *ctx) { return bpf_strncat(kern_buf, sizeof(kern_buf), NULL, 2); }
> [ ... ]
>> diff --git a/tools/testing/selftests/bpf/progs/string_kfuncs_success.c b/tools/testing/selftests/bpf/progs/string_kfuncs_success.c
>> index f65b1226a81a3..93996b0e9595e 100644
>> --- a/tools/testing/selftests/bpf/progs/string_kfuncs_success.c
>> +++ b/tools/testing/selftests/bpf/progs/string_kfuncs_success.c
> [ ... ]
>> @@ -59,5 +60,7 @@ __test(-ENOENT) int test_strncasestr_notfound1(void *ctx) { return bpf_strncases
>>   __test(-ENOENT) int test_strncasestr_notfound2(void *ctx) { return bpf_strncasestr(str, "hello", 4); }
>>   __test(-ENOENT) int test_strncasestr_notfound3(void *ctx) { return bpf_strncasestr("", "a", 0); }
>>   __test(0) int test_strncasestr_empty(void *ctx) { return bpf_strncasestr(str, "", 1); }
>> +__test(10) int test_strcat_success(void *ctx) { return bpf_strcat(buf, sizeof(buf), "world"); }
>> +__test(13) int test_strncat_success(void *ctx) { return bpf_strncat(buf, sizeof(buf), "world", 3); }
> [Severity: Medium]
> Does this test expect an incorrect return value?
>
> The BPF test loader isolates subtests by reloading the skeleton for each test
> program. This resets the global variable buf back to its initial .data state
> of "hello" (5 bytes) before this test runs.
>
> Because bpf_strncat() appends "wor" (3 bytes) to "hello", won't the correct
> return value be 8 instead of 13?
>
> [Severity: High]
> This is a pre-existing issue, but I noticed a potential problem in the
> __bpf_strncat() implementation being tested here.
>
> kernel/bpf/helpers.c:__bpf_strncat() {
>          ...
>          __get_kernel_nofault(&cs, src, char, err_out);
>          if (cs != '\0' && sz > copied)
>                  return -E2BIG;
>          ...
> }
>
> Does this unconditionally read past the requested size boundary?
>
> If a caller requests exactly sz bytes, and the source string satisfies this
> but ends at a page boundary, won't the unconditional read of the next byte
> cause a spurious page fault and incorrectly return -EFAULT instead of success?

Thanks, i'll fix it in v3 ;)

Rong Tao

>
>>   char _license[] SEC("license") = "GPL";

