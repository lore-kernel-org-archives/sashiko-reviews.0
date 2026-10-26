Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793051516;
	b=UHCbSfyhD8j+xYXOHm39aaqLkfuAo54dogLfqMfFC1HOWHZkIHzfMODXYGKIby+6LqdH
	 yWd3Wn+ovu5SfRAH2r1Rkp1+3OmEs0wX5wv5svTpUR0S7qpE+w6Gq/iVi/NpDYrIUfqzo
	 VTCTXM8kZSULgrnree5LWlKPLMGCOxHsmIycNZVArFdc+q7N/GFTv3IEqwJ4PWGXqEtv1
	 +Zt4D+cLdp4O1pShqeupVX8+/j2ffBIGVadL4UED9O+MtqbFrGL3RVSqWBWNdTEBKqDnc
	 +ahYes03Mf1UrDnfhqS2eH1UU6s/srdjGS7anDVdcWImcEenVfXdMBAtQ2ZPls6iotg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793051516;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=6Hio2H0utwAIyxxhgVH/5n+oK2ZNwQDLtqxwHftDHhI=;
	b=CT52isYMYsIMJLBYwWuQyMVv5va41s7mOD07asgrJML9x9a/InwQZC7HIaaplvHzob0u
	 G51q2MXOrL4XLp+ljxvCI8SkJcFQFBiPnb+PwYkoOyX+0zIWq5kOIwcooytHlN+oR6iTt
	 9WzfweyYe9615dbLCUGW0iIOIFhbD64F2iR1bhu0C9PEVAz0x0ls7nBCXwBmDSxc/dE3n
	 bneiVBDXqOfIvRfsIQfy2fIp8PFFAFfPqX5EI4PMJPWxunU3SjGA9XXl0UGPZsiDMUucb
	 Tmd/14XpWX/UckyRO+5+ZemUib7E1Q3jleGD8sbAssa12iubWQtn5wkEbPLasrYmSlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=cUIWuxF7;
	arc=none smtp.remote-ip=95.215.58.13
Received: from mta1.migadu.com (out-13.mta1.migadu.com [95.215.58.13])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7E1606A31A
	for <sashiko-reviews@lists.linux.dev>; Mon, 26 Oct 2026 21:51:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB7E1606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=cUIWuxF7
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=Zq216ynIgf+aDyYLsrgqAPxasG85w4rWKWBh7CqEE+I=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793051512; v=1; x=1793656312;
 b=cUIWuxF7Q9e5rixdiyPSZMMT7426dSDzZVk0FpyQN9Cvv4hlh83DTqSz3y1xS+lFRhXbRJSq
 MbSv1zfZtItlXSQDVsENX0Wu7H+WMy/cuhbtGYCntGCX6Jn+/Q154Spwc+hiJyKPlMlCq4tvKC3
 umi8/fOkMgRBARqkiO85oeR8=
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id b7649b005e064238;
	Mon, 26 Oct 2026 21:51:52 +0000
X-Mizu-Trace-ID: b7649b005e064238
X-Migadu-Flow: FLOW_OUT
Message-ID: <6709a9b7-a9c0-4f1d-ad29-87a03a12ede3@linux.dev>
Date: Mon, 26 Oct 2026 14:51:46 -0700
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
Subject: Re: [PATCH bpf-next v3 11/12] [do not merge] bpf: Track low-32 scalar
 equality across narrowing stack spills
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
References: <20261020161907.2115379-1-vineet.gupta@linux.dev>
 <20261020161907.2115379-12-vineet.gupta@linux.dev>
 <sashiko-outbox-179371@kernel.org>
From: Vineet Gupta <vineet.gupta@linux.dev>
Content-Language: en-US
In-Reply-To: <sashiko-outbox-179371@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/20/26 9:42 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] bpf: zext_32_to_64() on 4-byte spill loses signed bounds on ldsx fill
> --
>
> commit b63f0039bbb8ede3ae56c9d69df1283e246bde61
> Author: Vineet Gupta <vineet.gupta@linux.dev>
>
> bpf: Track low-32 scalar equality across narrowing stack spills
>
> This patch tracks low-32 scalar equality across 4-byte narrowing stack
> spills by assigning a scalar ID, truncating the spilled slot with
> zext_32_to_64(), and setting link_kind to BPF_REG_LINK_ZEXT.
>
>> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
>> index 083b5bd70d3fa..de2a5c048a29a 100644
>> --- a/kernel/bpf/verifier.c
>> +++ b/kernel/bpf/verifier.c
> [ ... ]
>> @@ -3927,15 +3928,46 @@ static int check_stack_write_fixed_off(struct bpf_verifier_env *env,
>>   	mark_stack_slot_scratched(env, spi);
>>   	if (reg && !(off % BPF_REG_SIZE) && reg->type == SCALAR_VALUE && env->bpf_capable) {
>>   		bool reg_value_fits;
>> +		bool subreg_link;
>>   
>>   		reg_value_fits = get_reg_width(reg) <= BITS_PER_BYTE * size;
>> +		/*
>> +		 * A narrowing spill stores the low 32 bits of the source, so
>> +		 * the slot is their zero-extension: record a low-32 link
>> +		 * rather than dropping the relation, as a 32-bit mov does.
>> +		 * A store never sign-extends, so there is only one link kind here.
>> +		 */
>> +		subreg_link = !reg_value_fits && size == 4;
>> +
>>   		/* Make sure that reg had an ID to build a relation on spill. */
>> -		if (reg_value_fits)
>> +		if (reg_value_fits || subreg_link)
>>   			assign_scalar_id_before_mov(env, reg);
>>   		save_register_state(env, state, spi, reg, size);
>> -		/* Break the relation on a narrowing spill. */
>> -		if (!reg_value_fits)
>> -			bpf_clear_scalar_id(&ss->spilled_ptr);
>> +		if (!reg_value_fits) {
>> +			if (subreg_link && reg->id) {
>> +				/*
>> +				 * save_register_state() copies the source
>> +				 * whole, but the store only wrote its low 32
>> +				 * bits, so truncate to those before recording
>> +				 * the kind: a slot asserting BPF_REG_LINK_ZEXT
>> +				 * over the source's wider bounds is a register
>> +				 * state that contradicts itself.
>> +				 *
>> +				 * Keep the source's delta, though: the slot
>> +				 * holds (u32)(base + delta), so resetting it to
>> +				 * 0 would record a relation off by that delta.
>> +				 */
>> +				zext_32_to_64(&ss->spilled_ptr);
>> +				ss->spilled_ptr.link_kind = BPF_REG_LINK_ZEXT;
> [Severity: Medium]
> Does calling zext_32_to_64() on ss->spilled_ptr cause a precision
> regression when the 4-byte slot is subsequently filled by a sign-extending
> load (ldsx)?

Yes precision regression and it also changes a verdict.

Say r6 is given [-16, 15], a small signed range straddling zero, spilled 
4 bytes and filled back with ldsx.
On a patch-10 kernel the program verifies; with 11/12 applied it is 
rejected, because the fill no longer knows r2 <= 15:

     p10      sext_fill_keeps_small_signed_range   success
     p10+11   sext_fill_keeps_small_signed_range   failure ("div by zero")

Thx,
-Vineet

> When spilling a scalar register whose signed range straddles zero (for
> example [-10, 10], where reg_umax(reg) is U64_MAX and get_reg_width(reg)
> is 64) with a 4-byte store (*(u32 *)(r10 - 8) = rX), subreg_link is true
> and zext_32_to_64(&ss->spilled_ptr) is called:
>
> static void zext_32_to_64(struct bpf_reg_state *reg)
> {
> 	reg_step_check_unsigned(reg, 32);
> 	reg->var_off = tnum_subreg(reg->var_off);
> 	reg_set_urange64(reg, reg_u32_min(reg), reg_u32_max(reg));
> }
>
> Because r32 = [-10, 10] straddles zero in unsigned 32-bit arithmetic
> (u32_min = 0, u32_max = 0xffffffff), zext_32_to_64() overwrites
> ss->spilled_ptr.r64 with [0, 0xffffffff] while leaving [-10, 10] only in
> r32.
>
> If the slot is then reloaded with a sign-extending load (*(s32 *)(r10 - 8),
> *(s16 *)(r10 - 8), or *(s8 *)(r10 - 8)), check_stack_read_fixed_off()
> copies ss->spilled_ptr to the destination register and check_mem_access()
> calls coerce_reg_to_size_sx():
>
> static void coerce_reg_to_size_sx(struct bpf_reg_state *reg, int size)
> {
> 	...
> 	/* If every value fits the signed N-bit range sign extension is a noop. */
> 	if (reg_smin(reg) >= -limit && reg_smax(reg) < limit)
> 		return;
>
> Because coerce_reg_to_size_sx() inspects reg_smin(reg) and reg_smax(reg)
> from r64 rather than r32, smax is 0xffffffff (>= limit), so the early
> return no longer triggers and coerce_reg_to_size_sx() falls through to
> set_sext64_default_val(), resetting both r64 and r32 to [S32_MIN, S32_MAX]
> (or the full S16/S8 range).
