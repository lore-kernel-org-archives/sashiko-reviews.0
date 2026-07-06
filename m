Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E5342E8FC
	for <sashiko-reviews@lists.linux.dev>; Mon,  6 Jul 2026 12:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783341877; cv=none; b=tjlEZ4dXEmOmRY+2vQ8RL9PmOYgOK2ElQazERHp/PrvV/5cPZie/Vb3TsMdgpSKk3eepu+nQJ0ur+P7m4jgcOp/wXw4F6buFq8vcPTg55F+Pow3y92YMrTEmfP11DS0GAiKMgSIMI/mhXbMb4A/H5IzIbXIe3Wnj13sLRmWLLBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783341877; c=relaxed/simple;
	bh=A6J3qZ1+JzJgiX28rP9twI3tGY+ys//pbkUnyVWTm5s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RJvbwwU4el4WUZ+jh6yVTJZ3J0GzXJWFWgE/VDatyV4My5Pgsp59/lZr90rXXvJmUpxFvGvg+zy9XXZrqe9QpiGlCnL4hm/oEA5nwSoAH46YHZmPt8+2ad+xIbLO16r5ygIhOZTJxe9w1bj10+kwsa5FsZXYO8ec1mbflSYOV0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aRBLG77y; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aRBLG77y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783341872;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rSNzVEuRNXjbACmsP0kXVdabmw9oRqyKD7jVej0sPKA=;
	b=aRBLG77yphMs69lu94k4pleNv1TGkuRFU8crHdCus+4BXGHqNRRiNRracye0pwRHjRWmwP
	dMkWpWp4tKV4Lu2yyHQ8A+qzkFyyXQ5gjl/GVkK0TPAV9jpQYO5x3dBd/KUWI9Dr+Gj6gl
	foyItOKS+dtcqPNmuFDjVVaNubOyvVQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-349-PBfz5OAFMiGZVIYzqByojw-1; Mon, 06 Jul 2026 08:44:31 -0400
X-MC-Unique: PBfz5OAFMiGZVIYzqByojw-1
X-Mimecast-MFC-AGG-ID: PBfz5OAFMiGZVIYzqByojw_1783341870
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-493bfc3b84aso13496795e9.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 06 Jul 2026 05:44:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783341870; x=1783946670;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rSNzVEuRNXjbACmsP0kXVdabmw9oRqyKD7jVej0sPKA=;
        b=gHRL5i71oFg5kMouDWehlcIL9uWlHEwtgPYqu8jbVUe5YS95my3/RQJpAPhaSrqyOl
         VZC4LqD+J4IYKBzc+6j8GfOoxAE7iZDQlSciGhu8MKarUtOQRZfIX6Ov2s6qK9mIDddr
         0e6C7N45X7f94W6q8+uHtMlwRSeZIbXz8VpxLlCYbBDi4nnbeDL3nYOc9XQwnFg5pmpl
         IBG04BmIfaYg46nbanffW94dVsO9sH/IBEtqnjgsOorzsAV4F72iMmq6+95byzbCY8Gf
         SkFRWAX0KHRJO8Yc6KzM7ElidvHgjiQBG83yHmXz3kXPLQfMQNaauPf8Fy2YIqsTHxjX
         LQdw==
X-Gm-Message-State: AOJu0YxRwqOGvkl2xFNnyXjy8JJ0HLAXKdMfy3EgwkLV4n82DZyX1HIC
	48HngHCjoncQmwf+TQfbbUb/it3NzJyoT0mpOXEKEy1Qn2lF2xmT37ofNJQ6XvyxFpy6BPb0o0x
	sUekp51woW9fIpRltZcJCh4ZAWbOtL1QkS9aBml+ihkW1ZXKYWXXOa3FXDeQoeDM5ONtkZyie/t
	VueG4p8QQJpVJKqVzcuhwix4pcTi560M3rPaPtHlSEuLwR/31mg4UU
X-Gm-Gg: AfdE7ckpIRj8vlt19ust0SShq7NDp4z0MHzXRutkpS0uq9h7Gmlo/o6MY0QvgeYGo78
	Tx6OXM3empsR5VmFzPguNIJwFAtdjauCiVKcHPqWyR/MFZoBumt5G1iMY+Uw9tqSMp+yi4VCN54
	UALj1n7G3oxxISSRNHa+18p1f9wKwPLPDHtQAT4jUHcJlMIK8/X1EKCx+VPFo6zwZcN5at+m9qs
	0mu6zhz+2vguMnjfZW8PJRULJZN1sDhY0yFU1GognE1scLxv0vdW1IP0Q8OyaiXhuir7LvByQkn
	9sMMhQpdZYuHV8J83zYObJOz+35XPUtEbHd5oZ/m64NYG4KNkW3d4ZTLV0I/53LAfMS8s48bJag
	TwVVoYqtKj1UhG9Qs+61CVC9Qu0LFxJCbvcWsEXfcHSBHMA==
X-Received: by 2002:a05:600c:5297:b0:493:d1e0:a4f1 with SMTP id 5b1f17b1804b1-493deffbf21mr4834445e9.0.1783341869902;
        Mon, 06 Jul 2026 05:44:29 -0700 (PDT)
X-Received: by 2002:a05:600c:5297:b0:493:d1e0:a4f1 with SMTP id 5b1f17b1804b1-493deffbf21mr4834055e9.0.1783341869459;
        Mon, 06 Jul 2026 05:44:29 -0700 (PDT)
Received: from [192.168.0.135] (185-219-167-205-static.vivo.cz. [185.219.167.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493ccdb62d3sm303300755e9.8.2026.07.06.05.44.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 05:44:28 -0700 (PDT)
Message-ID: <c0a3c830-0b28-47a9-96ee-c0a0f34490eb@redhat.com>
Date: Mon, 6 Jul 2026 14:44:27 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] perf trace: Refactor augmented_raw_syscalls using
 bpf_for
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org, linux-perf-users@vger.kernel.org
References: <cover.1783339165.git.vmalik@redhat.com>
 <fdf56026e442e44b2374119c21babde4910f3b6e.1783339165.git.vmalik@redhat.com>
 <20260706121432.8F39A1F00A3A@smtp.kernel.org>
From: Viktor Malik <vmalik@redhat.com>
In-Reply-To: <20260706121432.8F39A1F00A3A@smtp.kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: eXK_MymvrI2OTjE2JeOxxiIW2w20vREjzR67nqcOjo4_1783341870
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/6/26 14:14, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The fallback standard `for` loop will fail to load with `-E2BIG` on older kernels when compiled with Clang 15-18, breaking backward compatibility.
> --
> 
> commit be9035b8b528902be67522e81fa232a2f597b164
> Author: Viktor Malik <vmalik@redhat.com>
> 
> perf trace: Refactor augmented_raw_syscalls using bpf_for
> 
> The commit replaces the standard `for` loop in `augment_sys_enter()` with
> `bpf_for` to fix BPF verifier `-E2BIG` errors on newer Clang versions. It
> drops artificial verifier workarounds in `augment_arg()` that were previously
> added to fix these errors. A fallback standard `for` loop is kept for backward
> compatibility with older kernels lacking `bpf_for`.
> 
>> diff --git a/tools/perf/util/bpf_skel/augmented_raw_syscalls.bpf.c b/tools/perf/util/bpf_skel/augmented_raw_syscalls.bpf.c
>> index bc036a348079d..215516df5d2a3 100644
>> --- a/tools/perf/util/bpf_skel/augmented_raw_syscalls.bpf.c
>> +++ b/tools/perf/util/bpf_skel/augmented_raw_syscalls.bpf.c
>> @@ -440,10 +442,11 @@ static inline int augment_arg(struct syscall_enter_args *args, int i,
>>   */
>>  static inline int augment_arg(struct syscall_enter_args *args, int i,
>>  			      unsigned int *beauty_map,
>> -			      struct augmented_arg *payload_offset)
>> +			      struct beauty_payload_enter *payload, u64 offset)
>>  {
>> -	int index, value_size = sizeof(struct augmented_arg) - offsetof(struct augmented_arg, value);
>> -	s64 aug_size, size;
>> +	int index, size, value_size = sizeof(struct augmented_arg) - offsetof(struct augmented_arg, value);
>> +	struct augmented_arg *payload_offset;
>> +	s64 aug_size;
> 
> [ ... ]
> 
>> -	} else if ((int)size < 0 && size >= -6) { /* buffer */
>> +	} else if (size < 0 && size >= -6) { /* buffer */
> 
> [ ... ]
> 
>> @@ -522,14 +529,30 @@ static int augment_sys_enter(void *ctx, struct syscall_enter_args *args)
>> 	/* copy the sys_enter header, which has the syscall_nr */
>> 	__builtin_memcpy(&payload->args, args, sizeof(struct syscall_enter_args));
>>  
>> -	for (int i = 0; i < 6; i++) {
>> -		written = augment_arg(args, i, beauty_map, (struct augmented_arg *)payload_offset);
>> -		if (written < 0)
>> -			return 1;
>> -		if (written > 0) {
>> -			output += written;
>> -			payload_offset += written;
>> -			do_output = true;
>> +	if (bpf_ksym_exists(bpf_iter_num_new)) {
>> +		bpf_for(i, 0, 6) {
> 
> [ ... ]
> 
>> +	} else {
>> +		for (i = 0; i < 6; i++) {
>> +			written = augment_arg(args, i, beauty_map, payload, output);
> 
> [Severity: Medium]
> Will this fallback standard `for` loop fail to load with `-E2BIG` on older
> kernels when compiled with Clang 15-18?
> 
> Since the `(int)size < 0` cast and `s64 size` verifier workarounds were removed
> from `augment_arg()`, it appears the unrolled loop in this fallback path will
> once again fail the BPF verifier checks when evaluated on kernels older than
> 6.4 (where `bpf_ksym_exists(bpf_iter_num_new)` is false). Could this break
> backward compatibility for `perf trace` on those older kernels?

Oh, right, I guess we need that combination to remain backwards
compatible, too. I'll keep the hack in place, then.

Viktor

> 
>> +			if (written < 0)
>> +				return 1;
>> +			if (written > 0) {
>> +				output += written;
>> +				do_output = true;
>> +			}
>>  		}
>>  	}
> 

