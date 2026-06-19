Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D273426E70E
	for <sashiko-reviews@lists.linux.dev>; Fri, 19 Jun 2026 23:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781912363; cv=none; b=gtF1RTVlnwgK/EDpsw5A68QAF7fbnDkKCuCS/HNLAxZV9vPk8Qv9lTLOs16r/MH8rVA/i85fgVXwCVzRSYt1nnA9cAmgcmRaI6q4hALkXumn0maG9WnmPwi9Z6GZRfSXhY7RZHvQid/mXeOoXrDI08c5RB1rS+8X2hzue3nADzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781912363; c=relaxed/simple;
	bh=C1Y3OdP/bAcdNgU5rQcA7TEt7rhXSGoAbUtrrGhKV2Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Jh4kBp5w9V3klRhONmAxHubcREd96ZQhVeUizK1beFTH2EyI8qm6ecGwox5cxcK1THslsAJU+PZGptxgi9q+sTqdHuMwPEhhgyqiRJ26ys9MJWEDj0YnNQ7Ad+53M44QuyhGDiVs9LAYRQ+JJ/AmGqQdcjWs0H4kI3voLhJ/5ZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Y3WZgT3H; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Y3WZgT3H"
Message-ID: <4a08c2ca-8137-428d-9f27-337401b62f11@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1781912359;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NNpb7L2Dqpu2wyeTGuiQDnyk9igjFskq57DPZVvFEao=;
	b=Y3WZgT3H8P0jSvw93j3YMzpV/qRHSkpIE/CwHlCo0dnsmtnb9lwv5yEH5kyMBbH5WIycxb
	ruxLtUN44dm46SUyssPaguRnQC0ML7g2GWdK1u9ger8I6xD12OOvCGrRc4Nu6/sF/iB9tV
	eqpxZ5ploHhn096cDxFDp9B52Cn2vvk=
Date: Fri, 19 Jun 2026 16:39:05 -0700
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH v6 04/21] RISC-V: Define indirect CSR access helpers
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org,
 linux-perf-users@vger.kernel.org, conor+dt@kernel.org
References: <20260608-counter_delegation-v6-4-285b72ed65a9@meta.com>
 <20260609061511.276E31F00893@smtp.kernel.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Atish Patra <atish.patra@linux.dev>
In-Reply-To: <20260609061511.276E31F00893@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


On 6/8/26 11:15 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Unsafe statement-expression macro definitions causing delayed evaluation and variable shadowing hazards.
> --
>
> commit 572b7555547c1b5bc07701482ba67d379f6a2177
> Author: Atish Patra <atishp@rivosinc.com>
>
> RISC-V: Define indirect CSR access helpers
>
> This commit introduces helper macros to read, write, and perform WARL
> operations on indirect CSRs. The macros use statement-expressions to handle
> the multiple instructions required while disabling interrupts.
>
>> diff --git a/arch/riscv/include/asm/csr_ind.h b/arch/riscv/include/asm/csr_ind.h
>> new file mode 100644
>> index 0000000000000..6fd7d44dc640a
>> --- /dev/null
>> +++ b/arch/riscv/include/asm/csr_ind.h
>> @@ -0,0 +1,44 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (C) 2024 Rivos Inc.
>> + */
>> +
>> +#ifndef _ASM_RISCV_CSR_IND_H
>> +#define _ASM_RISCV_CSR_IND_H
>> +
>> +#include <linux/irqflags.h>
>> +
>> +#include <asm/csr.h>
>> +
>> +#define csr_ind_read(iregcsr, iselbase, iseloff) ({		\
>> +	unsigned long __value = 0;				\
>> +	unsigned long __flags;					\
> [Severity: Medium]
> Will these generic variable names (__value, __flags) cause shadowing issues if
> the caller passes in arguments with the same names?
>
> Evaluating macro arguments into unique local variables before entering the
> IRQ-disabled region would avoid this regression.
>
>> +	local_irq_save(__flags);				\
>> +	csr_write(CSR_ISELECT, (iselbase) + (iseloff));		\
>> +	__value = csr_read(iregcsr);				\
>> +	local_irq_restore(__flags);				\
>> +	__value;						\
>> +})
>> +
>> +#define csr_ind_write(iregcsr, iselbase, iseloff, value) ({	\
>> +	unsigned long __flags;					\
>> +	local_irq_save(__flags);				\
>> +	csr_write(CSR_ISELECT, (iselbase) + (iseloff));		\
>> +	csr_write(iregcsr, (value));				\
> [Severity: Medium]
> Since value is evaluated here after CSR_ISELECT has been programmed, what
> happens if a caller passes an expression that accesses another indirect CSR,
> such as a nested csr_ind_read(), as the value argument?
>
> It appears the nested call would overwrite CSR_ISELECT, causing the write to
> silently corrupt the wrong hardware register. Evaluating arguments into local
> variables before disabling interrupts would prevent this, and also avoid the
> risk of evaluating expressions with side effects while interrupts are disabled.
>
>> +	local_irq_restore(__flags);				\
>> +})
>> +
>> +#define csr_ind_warl(iregcsr, iselbase, iseloff, warl_val) ({	\
>> +	unsigned long __old_val = 0, __value = 0;		\
>> +	unsigned long __flags;					\
> [Severity: Medium]
> Do these generic local variables risk shadowing caller arguments?
>
>> +	local_irq_save(__flags);				\
>> +	csr_write(CSR_ISELECT, (iselbase) + (iseloff));		\
>> +	__old_val = csr_read(iregcsr);				\
>> +	csr_write(iregcsr, (warl_val));				\
> [Severity: Medium]
> Is there a risk that evaluating warl_val here could overwrite CSR_ISELECT if
> the caller provides an expression that performs another indirect CSR access?
>
>> +	__value = csr_read(iregcsr);				\
>> +	csr_write(iregcsr, __old_val);				\
>> +	local_irq_restore(__flags);				\
>> +	__value;						\
>> +})
>> +
>> +#endif

Given the callers, I don't think the possibilities raised by Sashiko can 
actually happen.
It's a macro. So the new callers should ensure they are invoking it with 
proper argument.

N/A.


