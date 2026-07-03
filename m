Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA113CE096
	for <sashiko-reviews@lists.linux.dev>; Fri,  3 Jul 2026 11:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783078757; cv=none; b=Lr7vxrZa/Gg+vPl6CM9hmi+AaxezKeTT97OGoA6QexAQZVsxwbmaDq3pnhacZX9IaIwCa1os7/wpc+XKqsk5SRtCl5Zhbb1Q4BmLS3tf5Zq723yv9pBLjmeXHzVyvYg6ANvhh+5e7C7rNHt30xY6IHQ0AauLZwEcQebQnGTGXNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783078757; c=relaxed/simple;
	bh=HTuWxujs7lhBqsGN8sDhd5w5xbwAqpF+EezVu1G84XU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UXb2wBX9W4OGRqyGgds3b2k9JcbOZDfWwk41KH1FdQWTU1m6X68Q/M/5O0FV/wer4jTd34ig06b1TnfGBeKjUkX06DmsDgMS6L5JJcJGitMlj58SrBuTTtooXw/TbWyn1iirV6A3DqyTXPClRtxF63IA1YteWZ6dnQUo9/Vfr9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=au3uZnOJ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="au3uZnOJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783078755;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3OLchXC5VTZDu4RU5sMVkomKCaHx+xb1Y8HfxV81VH8=;
	b=au3uZnOJURDCxi/gFjG/JaB/KygNnamByTrR4fJF4cZpU21FRIVrY/iOBCLelQvZCiTcsc
	SGb5NSuB2DM+wZc27sPkvtn0Y2QHBfAOo1hcwDJwz86qSzDS+vR+uc+y9LawxCW+sENZ0r
	X2aOAue3gJrzDUhj3e+O/dxRVF4Be0Q=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-136-4YMKFg-wO52vW1YEiBteVQ-1; Fri, 03 Jul 2026 07:39:12 -0400
X-MC-Unique: 4YMKFg-wO52vW1YEiBteVQ-1
X-Mimecast-MFC-AGG-ID: 4YMKFg-wO52vW1YEiBteVQ_1783078751
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-47485fde05aso369008f8f.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 03 Jul 2026 04:39:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783078751; x=1783683551;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3OLchXC5VTZDu4RU5sMVkomKCaHx+xb1Y8HfxV81VH8=;
        b=EtHozzXYGW90kySNeCFHjEQDAoKLnYdLYpKDqk/gb2wSIh/07grlu1Q+My3EHwnKuy
         oBXgce5Gr0ot6Mk4ap/6B04I5N+WQJRCPO+YTBt3IadQ/DHa3aCbj+zZ/ZlO8+eiQd3t
         LRiEfLorOSZSAGd932vkxpffkpNUjpn2s8OxA/cYxR0M1IPglNffqtAW2eO0u40Ru7Gk
         lfPIi/B7mJRaEIiJA9y09xh2wnEg7grxMwD371htwzLDIvzl9GqFrq9GGrny//uAyZO7
         2HEGFcVqLFSuV0HsRBAFVs4Bm5Ovj1tr6DXEs/PR4eSFy8oMFCbZmtInzcf10TkltM1Y
         NMrg==
X-Gm-Message-State: AOJu0Yz4kPhyc+06loDLBTtP5vINAWEHmGxLrQHgd/1TlGajM1VDBQCR
	+qkWQ8aJLrgSxt17FKMs1Eb7nBRrR6/N6CX8Xy0DUqV7EO4jWwq+HO0dnjaYoIXYeG8kStJ/aY4
	8Hg30CrlTvaKKFgDrXfOH3Lq8JPQsJowZUbA3BLUbcn5qjKq3XtGitbehir+l6wnnSgYcRgViPl
	b0YctZNZdUyNX/2MCH60eJKkEiEwy4k9EBgkFYpTBHHoB7fzNuIelh
X-Gm-Gg: AfdE7cneMfi8hpb8GBL3lJKFWn1y4ez55q7XSKKAQuMmN7OfhwTq4luT/HLEUbmpwTc
	p0nAb2YV9w97lkAS5gu0O/XeNOKa3vhohXmTZrqbdUke9wVZOIfRtp9xRXfYjqn9k0JxpClgZEN
	20OJatfsHxJi73+Froit4VTrQvcFv9f9NnQRz4BxCvg6x0klPmAkstg8nUKBeJwTc09Shoc6f+T
	JbPBtgSq227bhMIbST2nJOSQH8CCdUE97samGNbTu7Tq1tDv+XjiOiINboJvsENXNJP/ffv01vU
	0a6qnSJTVOGMvaEaBRJawQYigZW4gCWqId/iEJI4yQG3OHxW3IHz/VzkdB0fIF1ulqMfSYZpffg
	7NUGQ8XgZyB8/ovedig1MR0G11/sDMKdbaOaAvzjz
X-Received: by 2002:a05:600c:63d5:b0:493:b87c:c87d with SMTP id 5b1f17b1804b1-493c2b4c910mr94562855e9.11.1783078751026;
        Fri, 03 Jul 2026 04:39:11 -0700 (PDT)
X-Received: by 2002:a05:600c:63d5:b0:493:b87c:c87d with SMTP id 5b1f17b1804b1-493c2b4c910mr94562505e9.11.1783078750512;
        Fri, 03 Jul 2026 04:39:10 -0700 (PDT)
Received: from [192.168.0.199] (adsl-dyn37.91-127-59.t-com.sk. [91.127.59.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c636ec8asm106968465e9.1.2026.07.03.04.39.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 04:39:10 -0700 (PDT)
Message-ID: <f6ac51ab-318d-4a00-9e97-e76d0f86122a@redhat.com>
Date: Fri, 3 Jul 2026 13:39:08 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] perf trace: Refactor augmented_raw_syscalls using
 bpf_for
To: sashiko-reviews@lists.linux.dev
Cc: linux-perf-users@vger.kernel.org, bpf@vger.kernel.org
References: <cover.1783070132.git.vmalik@redhat.com>
 <8ceb8f3323d0742163c42c343eb9d26843fe9e9b.1783070132.git.vmalik@redhat.com>
 <20260703104554.CAE821F000E9@smtp.kernel.org>
From: Viktor Malik <vmalik@redhat.com>
In-Reply-To: <20260703104554.CAE821F000E9@smtp.kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: jzf7wNJvEtRBSb_Hyo2J6zwUM1zhONPW1vNBz4brlks_1783078751
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/3/26 12:45, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [High] Removing the `(int)` cast in the buffer augmentation condition makes it unconditionally false, completely breaking buffer payload collection.
> - [Medium] Huge buffer sizes (where the MSB is set) fail to be augmented, whereas previously they were safely clamped to `TRACE_AUG_MAX_BUF`.
> - [Low] Multi-line comment does not follow the required BPF subsystem style.
> --
> 
> commit 0a122bc3ab16635b5165b20566e6e1890cba855b
> Author: Viktor Malik <vmalik@redhat.com>
> 
> perf trace: Refactor augmented_raw_syscalls using bpf_for
> 
> This commit replaces the standard loop in augment_sys_enter with a bpf_for
> loop to prevent BPF verifier -E2BIG errors. It also drops some workarounds
> previously added to help the verifier.
> 
>> diff --git a/tools/perf/util/bpf_skel/augmented_raw_syscalls.bpf.c b/tools/perf/util/bpf_skel/augmented_raw_syscalls.bpf.c
>> index cbdd5ce19a2f6..60babc06f3812 100644
>> --- a/tools/perf/util/bpf_skel/augmented_raw_syscalls.bpf.c
>> +++ b/tools/perf/util/bpf_skel/augmented_raw_syscalls.bpf.c
> 
> [ ... ]
> 
>> @@ -464,11 +473,13 @@ static inline int augment_arg(struct syscall_enter_args *args, int i,
>>  	} else if (size > 0 && size <= value_size) { /* struct */
>>  		if (!bpf_probe_read_user(((struct augmented_arg *)payload_offset)->value, size, arg))
>>  			augmented = true;
>> -	} else if ((int)size < 0 && size >= -6) { /* buffer */
>> +	} else if (size < 0 && size >= -6) { /* buffer */
> 
> [Severity: High]
> Does removing the (int) cast make this condition unconditionally false?
> 
> Since size is an s64 assigned from an unsigned int beauty_map[i], a negative
> marker (e.g. 0xFFFFFFFF) is zero-extended to a positive s64 value.
> Without the (int) cast to truncate and sign-extend it back, size < 0 is
> always false, breaking buffer payload collection.

Correct, size should have been made int. Will fix that.

>>  		index = -(size + 1);
>>  		barrier_var(index); // Prevent clang (noticed with v18) from removing the &= 7 trick.
>>  		index &= 7;	    // Satisfy the bounds checking with the verifier in some kernels.
>> -		aug_size = args->args[index] > TRACE_AUG_MAX_BUF ? TRACE_AUG_MAX_BUF : args->args[index];
>> +		aug_size = args->args[index];
>> +		if (aug_size > TRACE_AUG_MAX_BUF)
>> +			aug_size = TRACE_AUG_MAX_BUF;
> 
> [Severity: Medium]
> Will huge buffer sizes (where the most significant bit is set) fail to be
> augmented here?
> 
> args->args[index] is an unsigned long. If the most significant bit is set,
> assigning it to the s64 aug_size makes it negative. The subsequent
> if (aug_size > TRACE_AUG_MAX_BUF) is a signed comparison and will evaluate
> to false. The length remains negative, causing the later if (aug_size > 0)
> check to fail, skipping buffer processing entirely instead of clamping it.

Yeah, the original version was better, will revert to that.

>>  
>>  		if (aug_size > 0) {
>>  			if (!bpf_probe_read_user(((struct augmented_arg *)payload_offset)->value, aug_size, arg))
> 
> [ ... ]
> 
>> @@ -521,14 +530,29 @@ static int augment_sys_enter(void *ctx, struct syscall_enter_args *args)
>>  	/* copy the sys_enter header, which has the syscall_nr */
>>  	__builtin_memcpy(&payload->args, args, sizeof(struct syscall_enter_args));
>>  
>> -	for (int i = 0; i < 6; i++) {
>> -		written = augment_arg(args, i, beauty_map, payload_offset);
>> -		if (written < 0)
>> -			return 1;
>> -		if (written > 0) {
>> -			output += written;
>> -			payload_offset += written;
>> -			do_output = true;
>> +	if (bpf_ksym_exists(bpf_iter_num_new)) {
>> +		bpf_for(i, 0, 6) {
>> +			written = augment_arg(args, i, beauty_map, payload, output);
>> +			if (written < 0)
>> +				return 1;
>> +			if (written > 0) {
>> +				output += written;
>> +				/* guide the verifier to forget range of `output`, which
>> +				 * helps to prove convergence of the loop
>> +				 */
> 
> [Severity: Low]
> This isn't a bug, but this multi-line comment does not follow the preferred
> BPF subsystem style where the opening /* is on its own line.

Will fix that, too.

I'll wait for some human reviews and will send v3 with the fixes.

>> +				output += ZERO;
>> +				do_output = true;
>> +			}
>> +		}
> 

