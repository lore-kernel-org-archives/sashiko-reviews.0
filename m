Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.249.212.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792548425;
	b=P+Hpdt9HMCiR4pBbnPQ1o77yPWWZlZEYnItG4jN0ylYys88MwWycPh2A4m0f8OdIdLg0
	 Aesnv6zDYBcLAYVCHwsuZM7ICj4cwFFzyH+/5E8JWx89syeNSPxXIwmi5yL31WTYvEluD
	 ypo33Q84S9U9yMM8SKaZOuX8PTsZktQuXVRw79n9uFl4i1ba4nd989MFGlcmlS3BwlNxa
	 SnmKKTvDxcp4Jz05CWZpBePPf6vXokJs4xdL5lCEp3eiYwWpB7/rsL/HaQhcI/j+JHZAH
	 anTyPSovkB8xf+9FNTGb+b9ILjxDapr1IH11JnQfeJe4itdq3237JJ3l/Xg0w6izxjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792548425;
	h=DMARC-Filter:Received:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-CM-SenderInfo;
	bh=l7KFQLIaTwlSBsukka0meVUJRSxCzsTjMjFc9CnbXDc=;
	b=kwLDX8q7pEPBTXSno6rQUSkCbeXPDCupxZufwAkH+yThWMzeAhijLEl6to3hamMSbs2u
	 k0BOVfIiqZNwfvBGQy2yqD/uKFPlnNhnFT9oeCaQD+5aLEZHwRmSy/w/jWXMcESvnpSET
	 YyW5XajkJznC4lSYHKS8gTLldw4WOfsW887g+6eziXmQMUuxgXMWLog+hTF0nc+3g2Rzd
	 kXy0QQIvcTURDxAJZPsHiHAE8AeI5N/Rw/nE4rZBiTnFL3pxmJWZWo4A53rac7uIAO0H/
	 28DCIFpcByftHAFEgf1kynMLpHcOMkVsssijON0F1d9EEr3lNsxWWIHfJRt40emQ9IQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=huaweicloud.com;
	spf=pass smtp.mailfrom=huaweicloud.com;
	arc=none smtp.remote-ip=45.249.212.51
Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com [45.249.212.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD035606A321
	for <sashiko-reviews@lists.linux.dev>; Wed, 21 Oct 2026 02:07:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD035606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.163.170])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4j8Xhx5BHczYQtnZ
	for <sashiko-reviews@lists.linux.dev>; Wed, 21 Oct 2026 10:06:57 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.75])
	by mail.maildlp.com (Postfix) with ESMTP id 98C7E40561
	for <sashiko-reviews@lists.linux.dev>; Wed, 21 Oct 2026 10:07:00 +0800 (CST)
Received: from [10.67.110.36] (unknown [10.67.110.36])
	by APP2 (Coremail) with UTF8SMTPA id Syh0CgD3xOpEHthqsiLhBA--.22682S2;
	Wed, 21 Oct 2026 10:07:00 +0800 (CST)
Message-ID: <d27f6108-fe6d-4d71-a601-b964e10e7f77@huaweicloud.com>
Date: Wed, 21 Oct 2026 10:07:00 +0800
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 13/15] perf annotate-arm64: Support 'adrp' instruction
 to track global variables
To: sashiko-reviews@lists.linux.dev
Cc: linux-perf-users@vger.kernel.org
References: <cover.1792411435.git.wutengda@huaweicloud.com>
 <145ac934f72c090987c2e6d0be28b28972f843c7.1792411435.git.wutengda@huaweicloud.com>
 <sashiko-outbox-179232@kernel.org>
Content-Language: en-US
From: Tengda Wu <wutengda@huaweicloud.com>
In-Reply-To: <sashiko-outbox-179232@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:Syh0CgD3xOpEHthqsiLhBA--.22682S2
X-Coremail-Antispam: 1UD129KBjvJXoWxuryDJrW7Kry5WF48Cw1ftFb_yoWrXry7pF
	WDGFy5Gw42vF10grsIqrWfXFySga17GF1fKryDKF4IkFy2vrn3KF9Ika1Ygay7JrZxZw1U
	Jan09rsrZF10ka7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUgmb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x
	0267AKxVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8C
	rVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4
	IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkE
	bVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67
	AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI
	42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMI
	IF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2
	KfnxnUUI43ZEXa7IU1wL05UUUUU==
X-CM-SenderInfo: pzxwv0hjgdqx5xdzvxpfor3voofrz/



On 2026/10/20 23:15, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] perf annotate-arm64: adjust_reg_index_state() drops global addr writeback
> --
> 
> commit 329d013c0c7d0b8be3fe8f0ec1e0f669451e6cbd
> Author: Tengda Wu <wutengda@huaweicloud.com>
> 
> perf annotate-arm64: Support 'adrp' instruction to track global variables
> 
> This commit extends arm64 data type profiling to track global variable
> addresses calculated via page-relative adrp instructions. It introduces
> TSR_KIND_GLOBAL_ADDR to store the page-aligned base address and resolves
> the symbol address and DWARF type on subsequent add or load instructions.
> 
>> diff --git a/tools/perf/util/annotate-arch/annotate-arm64.c b/tools/perf/util/annotate-arch/annotate-arm64.c
>> index 61df9c4f48776..bd060a823b765 100644
>> --- a/tools/perf/util/annotate-arch/annotate-arm64.c
>> +++ b/tools/perf/util/annotate-arch/annotate-arm64.c
> [ ... ]
>> @@ -722,6 +722,33 @@ static int propagate_load_reg_state(struct type_state *state,
>>  		return 0;
>>  	}
>>  
>> +	/* Or check if it's a global variable */
>> +	if (src_tsr->kind == TSR_KIND_GLOBAL_ADDR) {
>> +		u64 ip = dloc->ms->sym->start + dl->al.offset;
>> +		u64 addr = src_tsr->imm_value + reg_offset;
>> +		int offset;
>> +
>> +		if (!get_global_var_type(cu_die, dloc, ip, addr, &offset, &type_die) ||
>> +		    !die_get_member_type(&type_die, offset, &type_die))
>> +			return -1;
> [ ... ]
>> @@ -991,14 +1018,16 @@ static void update_add_insn_state(struct type_state *state,
>>  	if (arch_get_reg_offset(dloc->arch, src, sreg, state, false, &reg_offset))
>>  		goto add_non_regoff;
>>  
>> -	if (src_tsr.kind == TSR_KIND_CONST) {
>> +	if (src_tsr.kind == TSR_KIND_CONST || src_tsr.kind == TSR_KIND_GLOBAL_ADDR) {
>>  		tsr->kind = src_tsr.kind;
>> +		/* For 'adrp + add' pair: resolve the full global variable address. */
>>  		tsr->imm_value = src_tsr.imm_value + reg_offset;
>>  		tsr->offset = 0;
>>  		tsr->ok = src_tsr.ok;
> 
> [Severity: Medium]
> What happens when a pre-indexed or post-indexed load or store instruction
> (for example, ldr x0, [x19, #0x40]! or ldr x0, [x19], #8) uses a
> TSR_KIND_GLOBAL_ADDR register as its base?
> 
> Both update_load_insn_state() and update_store_insn_state() call
> adjust_reg_index_state(), which adds the writeback offset to tsr->offset:
> 
> tools/perf/util/annotate-arch/annotate-arm64.c:adjust_reg_index_state() {
> 	...
> 	if (arch_get_reg_offset(dloc->arch, op_loc, reg, state, true, &offset)) {
> 		invalidate_reg_state(tsr);
> 		return;
> 	}
> 
> 	tsr->offset += offset;
> 	...
> }
> 
> However, TSR_KIND_GLOBAL_ADDR stores the base address in tsr->imm_value,
> and all consumers — propagate_load_reg_state(), update_add_insn_state(),
> and check_matching_type() in tools/perf/util/annotate-data.c — compute the
> target address from imm_value + reg_offset while ignoring tsr->offset (and
> update_add_insn_state() resets tsr->offset to 0).
> 
> Should adjust_reg_index_state() update tsr->imm_value (or should the
> consumers include tsr->offset) so that pre/post-index writeback updates on
> global address registers are not lost on subsequent instructions?
> 
> [ ... ]
> 

The compiler does not combine them this way. The purpose of adrp + add is to
compute the full address of a global variable into a register, so that the
variable or its members can subsequently be accessed via [reg, #offset]. Once
the address has been computed, there is no reason to use a pre-/post-indexed
writeback on the same register, that would clobber the just-computed base
address and misalign all subsequent accesses to the global variable. Unless
there is some special compiler optimization?

In any case, I will keep it unchanged.

Thanks,
Tengda

