Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FCBD40D58A
	for <sashiko-reviews@lists.linux.dev>; Tue, 30 Jun 2026 05:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782798647; cv=none; b=RsIXCISgS8vr/AL1dDT5snN3kyYKgxpGNf40r8Qph/8jdp2AFKAKlq4hyQvKrHyKjeBnPRZJWH+WQKCbR193YZZ0W/+KQruRPX71N+qoRXGGpMBaqRlVZB8B3H++ZiEvoo4ddT/24vN1wjgudMZ23r+xtEsDYOhUnR4zJBGiGIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782798647; c=relaxed/simple;
	bh=PBVAwJx7rK/o/mtqhIphMhUCh4IfY1n466Xfz+zczDA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jhLFrql9NiaMGnGNu8Ldu5x3lIVoKPpsFFkUyqETOAxfPVb8h4e91rNhS6IXM7b9K4HUUyoWQO1U+7UimyFV73yukDhG/rXDGKgwSf3ksg+TFZY50UraMTGKE+YgiwPlo8VEdsIawxSoL+H6Ye+y8AR2ePeUn+c2fruFTgmQCkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=gLcl4/C0; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="gLcl4/C0"
Message-ID: <4a69beb4-d97b-4df3-9d79-ef08762f286d@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782798643;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7sJTiO0Hv8KRP94I1XGdDR3eyXiNYpT9AgWAVzgxews=;
	b=gLcl4/C0byIqu34XblEleuzMGPBQxiaXk2MR4dAzHW9bQ4cc/CNVtk7hMe/aw6B21xv1BI
	wfq+jgnqQQ3pOO9GU01hAlq9pb6hbO0faMIJmdd874Cai98Eq3zkEnmouCtEMQ5MfOCIyv
	ZN4/olE6ypFqV5iTRyag207YA8tZL2Y=
Date: Tue, 30 Jun 2026 13:50:35 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next v8 2/9] bpf: Introduce global percpu data
Content-Language: en-US
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
References: <20260629152406.52582-1-leon.hwang@linux.dev>
 <20260629152406.52582-3-leon.hwang@linux.dev>
 <20260629155020.AF8D01F000E9@smtp.kernel.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Leon Hwang <leon.hwang@linux.dev>
In-Reply-To: <20260629155020.AF8D01F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 29/6/26 23:50, sashiko-bot@kernel.org wrote:
[...]
>> +			/*
>> +			 * Reuse the original ld_imm64 insn, and add one
>> +			 * mov64_percpu_reg insn.
>> +			 */
>> +
>> +			insn_buf[0] = insn[1];
>> +			insn_buf[1] = BPF_MOV64_PERCPU_REG(insn->dst_reg, insn->dst_reg);
> 
> [Severity: High]
> This is a pre-existing issue, but does the BPF interpreter properly handle
> BPF_MOV64_PERCPU_REG?
> 
> The verifier correctly checks bpf_jit_supports_percpu_insn() before inserting
> this instruction. However, if JIT compilation fails later (e.g., due to memory
> limits) and the system falls back to the interpreter, what happens to this
> instruction?
> 
> Looking at ___bpf_prog_run() in kernel/bpf/core.c:
> 
>     ALU64_MOV_X:
>         switch (OFF) {
>         case 0:
>             DST = SRC;
>             break;
> 
> The interpreter appears to silently ignore OFF == BPF_ADDR_PERCPU, essentially
> treating it as a no-op or standard move.
> 
> Would this leak the raw __percpu pointer (which is often a small integer
> offset on architectures like x86) into subsequent memory access instructions?
> While this patch didn't introduce the interpreter fallback behavior, it seems
> to expand the surface area by allowing direct read/write accesses to arbitrary
> percpu arrays. Could this lead to out-of-bounds memory accesses if JIT fails?
> 

Correct. It will trigger a page fault.

The issue will be fixed by
https://lore.kernel.org/bpf/20260626154330.33619-1-leon.hwang@linux.dev/.

Thanks,
Leon

