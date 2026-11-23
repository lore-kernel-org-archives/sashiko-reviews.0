Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795411288;
	b=QxezrLg1/i0/WeqjA3NkqxEEDHpo29WYBEuGyrcIDZ5oDZj/a2av07E1Jxwk1gKiCCad
	 ZNGR6B4/Yulz0JhRi0zJeA9GetuFDU5Cy2pDbZlSB+CWCxFTVZ1p3DBuj3YvPz13WouLL
	 vHfA/8GxIXL9QX9LzSx98AjoWTy2l3XDIO0zBIbJdKCuNGiXWLnbm6dUl7Y5kggEivc5a
	 FcD7ih2l9xaWrjjG16WYP12xqth6+Q0IXZd0fx37+WFsoo6PXgHdg5RTfe/p+JlM78r5k
	 fYcRkDFhKSTr18HOQXYR4F6ZJuu6UeZXKzUBoTQgj5Wa7qKGggkbO7UZPNGviZenEsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795411288;
	h=DMARC-Filter:Received:Received:Subject:To:Cc:References:From:
	 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:Content-Type:
	 Content-Language:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-CM-SenderInfo:X-Coremail-Antispam;
	bh=MhKPy4hLEktud7DPzU2544Zryh9tYQQv+5VGX65PXXk=;
	b=FqA/HOWg5ADHgT4+TE2J8IkpLXlQZSdkPEVCRsbYfhdasvSVnoqFd714u1TRCeU240q4
	 oJSSY4/ja9ZneK1SsRiHXyWtq67vX4AzwRcT690MP2Tu9yjNIU5vRZjG3AmDviifrMNp7
	 R0WWb3tJ6fRRRJDuvR4z6QTFAYx4yuwdIVgjuXCoHRDLnCuehPls2Mq4Y+QDGa57xLo1n
	 FDom4TiTxlyFgqX7YLFgMUh0Y+yP1JJoX/USAhW6Yi4H8Z0x+QRhW0iwj5IhgNxPbM/oI
	 ISC+ugJMyqpKA2SFP1CI4m7DZ+mpK/4DMHoizjCs6KnFC14R42qMEUu1KzlwYl/DWcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=loongson.cn;
	spf=pass smtp.mailfrom=loongson.cn;
	arc=none smtp.remote-ip=114.242.206.163
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2197606A689
	for <sashiko-reviews@lists.linux.dev>; Mon, 23 Nov 2026 05:21:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2197606A689
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [123.138.236.242])
	by gateway (Coremail) with SMTP id _____8Bx69FUzQNr+x8iAA--.31703S3;
	Mon, 23 Nov 2026 13:21:24 +0800 (CST)
Received: from [127.0.0.1] (unknown [123.138.236.242])
	by front1 (Coremail) with SMTP id qMiowJBxpMxSzQNrps02AA--.17317S2;
	Mon, 23 Nov 2026 13:21:23 +0800 (CST)
Subject: Re: [PATCH bpf-next v1 1/3] selftests/bpf: Enable instruction array
 test for LoongArch
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
References: <20261123045008.23691-1-yangtiezhu@loongson.cn>
 <20261123045008.23691-2-yangtiezhu@loongson.cn>
 <sashiko-outbox-228693@kernel.org>
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <46ffa5b6-8914-eda6-a0ee-88b2d7ecba54@loongson.cn>
Date: Mon, 23 Nov 2026 13:21:22 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <sashiko-outbox-228693@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:qMiowJBxpMxSzQNrps02AA--.17317S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWrKrWkCF4fKFWDtFWrAw1UurX_yoW8JF15p3
	srZF1UAr4rWrWrtrnrK34fWa1Sqr1fGFZ7KF4YgrW8CFZruw4rAFWYgw4qqan8Zw4rWw10
	qFZ5C34vq3WkAFgCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07
	AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02
	F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF
	1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7Cj
	xVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r
	4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jb
	_-PUUUUU=

On 11/23/26 1:02 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:

...

> [Severity: Medium]
> Does enabling bpf_insn_array on LoongArch depend on a prerequisite JIT
> patch that is not in the tree yet?
> 
> In arch/loongarch/net/bpf_jit.c, bpf_int_jit_compile() does not call
> bpf_prog_update_insn_ptrs(), so insn_array->ips[] stays zeroed and
> bpf_insn_array_ready() rejects program loading with -EFAULT.  In addition,
> build_insn() only handles BPF_JMP | BPF_JA and BPF_JMP32 | BPF_JA, without
> BPF_JMP | BPF_JA | BPF_X (gotox), so the gotox subtests fail to JIT with
> -EINVAL (-ENOTSUPP).

This series depends on the unmerged LoongArch JIT support series:

LoongArch: BPF: Support instructions array, indirect jumps and calls
https://lore.kernel.org/loongarch/20261123043907.20225-1-yangtiezhu@loongson.cn/T/#u

> Also, HAVE_EBPF_JIT on LoongArch is only selected for 64BIT, while
> defined(__loongarch__) matches 32-bit builds as well.

I will update the guard to
(defined(__loongarch__) && __loongarch_grlen == 64)
in v2 (along with patch 3/3) to match 64-bit LoongArch specifically,
similar to RISC-V.

Thanks,
Tiezhu

