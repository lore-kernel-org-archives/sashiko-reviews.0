Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com [45.249.212.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3888B3EF678
	for <sashiko-reviews@lists.linux.dev>; Wed,  1 Jul 2026 08:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782895573; cv=none; b=IdlhsWYaPgslvQX6cMjIElKlCoWxXwDaiR4FxpJ5ECywPIfNfw+swl5sE0ot5txBCi783QKoFKO1HM1vIpnoIHDbOZp3QVRylkAMqKpBH6PUfoFzxPPdQY7vOg/Jz+KAQDSuNcd/Rli+dcBQWFMKBko5r5bI1mwlbeI6xwg5IY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782895573; c=relaxed/simple;
	bh=wXRCSqZYlrED0U9MY5G1wqpMCeIJ89aR/E00hMJSRSo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BDPYppWYoASN+tFkDwpmljnpCuREz2UWgW2M7o8h8/d9wa6CAAdtQsPDgGrX9wTT8H+V9XjDKGdmSappvk1KOMfQwEAao7XcCktY989XJsyWExQjO2AqTNNOMu9GaKNu4TX/uSYJxKO/Vss8ovw911Qkhj16533mYX16oZ3DvH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.163.198])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4gqtr41BpjzYQtmC
	for <sashiko-reviews@lists.linux.dev>; Wed,  1 Jul 2026 16:45:08 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id 5EE7340581
	for <sashiko-reviews@lists.linux.dev>; Wed,  1 Jul 2026 16:46:02 +0800 (CST)
Received: from [10.67.110.36] (unknown [10.67.110.36])
	by APP1 (Coremail) with UTF8SMTPA id cCh0CgC3iofK00RqsvjXAQ--.12647S2;
	Wed, 01 Jul 2026 16:46:02 +0800 (CST)
Message-ID: <7cd2afbf-51a6-4c47-8212-87fba14876ce@huaweicloud.com>
Date: Wed, 1 Jul 2026 16:46:02 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 17/21] perf annotate-arm64: Support 'mov' instruction
 tracking
To: sashiko-reviews@lists.linux.dev
Cc: linux-perf-users@vger.kernel.org
References: <20260701035355.752944-1-wutengda@huaweicloud.com>
 <20260701035355.752944-18-wutengda@huaweicloud.com>
 <20260701042109.565541F000E9@smtp.kernel.org>
Content-Language: en-US
From: Tengda Wu <wutengda@huaweicloud.com>
In-Reply-To: <20260701042109.565541F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:cCh0CgC3iofK00RqsvjXAQ--.12647S2
X-Coremail-Antispam: 1UD129KBjvJXoW7KFW8CryUJw4ftw1xJrWxCrg_yoW8uFykpa
	yqk345t3yjqrs0qwnxAF48Xa45Wr4fAa4rur1YqasIyrsIvr95KF97trWYkFWrGr1kCw4j
	vw1qyw4UW3yxCFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUgmb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY
	6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17
	CEb7AF67AKxVWUXVWUAwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF
	0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIx
	AIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVWxJr0_GcJvcSsGvfC2
	KfnxnUUI43ZEXa7IU1MKZJUUUUU==
X-CM-SenderInfo: pzxwv0hjgdqx5xdzvxpfor3voofrz/



On 2026/7/1 12:21, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Type state corruption due to DWARF register overloading for the stack pointer (`sp`) and zero registers (`xzr`/`wzr`).
> --
> 
> commit 8b77f0fe5f1ec7e9d14eee63f44f48d6c55f7234
> Author: Tengda Wu <wutengda@huaweicloud.com>
> 
> perf annotate-arm64: Support 'mov' instruction tracking
> 
> This commit extends update_insn_state() for arm64 to track register-to-register
> and immediate-to-register 'mov' instructions. It propagates data type
> information or immediate values to the destination register to improve type
> inference.
> 
>> diff --git a/tools/perf/util/annotate-arch/annotate-arm64.c b/tools/perf/util/annotate-arch/annotate-arm64.c
>> --- a/tools/perf/util/annotate-arch/annotate-arm64.c
>> +++ b/tools/perf/util/annotate-arch/annotate-arm64.c
> 
> [ ... ]
> 
>> +static void update_mov_insn_state(struct type_state *state,
>> +				  struct disasm_line *dl,
>> +				  struct annotated_op_loc *src,
>> +				  struct annotated_op_loc *dst)
>> +{
> 
> [ ... ]
> 
>> +	if (!has_reg_type(state, sreg) || !state->regs[sreg].ok) {
>> +		invalidate_reg_state(tsr);
>> +		return;
>> +	}
>> +
>> +	tsr->type = state->regs[sreg].type;
> 
> [Severity: Medium]
> Will this code corrupt the stack pointer's type state if the zero register
> (xzr or wzr) is used in a mov instruction?
> 
> Looking at tools/perf/util/dwarf-regs-arch/dwarf-regs-arm64.c, the function
> __get_dwarf_regnum_arm64() maps sp, wzr, and xzr all to DWARF register 31:
> 
>     if (!strcmp(name, "sp") || !strcmp(name, "wzr") || !strcmp(name, "xzr"))
>         return 31;
> 
> If a zero register is used as a destination (e.g., mov xzr, x0), does its
> tracked state overwrite the tracked state of the stack pointer?
> 
> Conversely, if a zero register is used as a source (e.g., mov x0, xzr),
> does the destination register incorrectly inherit the type of the stack
> pointer instead of being treated as a constant 0?
> 

I'll drop wzr/xzr register support to avoid this confusion.

