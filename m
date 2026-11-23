Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795410019;
	b=UA1Yc1DanHzrXwd9BwzG7HHF4G7r0oCMyD8tFy3TdUqsseNCdjm2Rk0B8+2kkf1Il2Kd
	 Bo4eAEyMLxFTfJLTWdgB2x/K1DKAq+Eummz48iGl5gt0a+JC69UzxeN7FnBuS5rUduUWl
	 M3I/ZderhPdzCutG0PjHaLx4WqmaImvN4Td1PV5MZO1DQ/boPj2hWe7EuG8onyOZshCpj
	 qZAVIoFrxpZxQPrGImm3gOsPmcLczlZQVHU5+9QewIdQi0hEJoc6tBpgMecYIDa7b40Ek
	 qu6GnA0E477cnjSb2ElFm+qo/tdLMk1xw/8VF+TfCkbYlSMW+P4yjqGopgwPBGIAgcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795410019;
	h=DMARC-Filter:Received:Received:Subject:To:Cc:References:From:
	 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:Content-Type:
	 Content-Language:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-CM-SenderInfo:X-Coremail-Antispam;
	bh=CnXALTCDnivJqSgnJ2wsUvnkTcsIEvJDi3TFHT1UVAg=;
	b=RlGmeXJJte4PyiOpodN2kMhO2L3RBRlPgpY4TTxardEmG6LpNbYmVQQGZNfbRc2xH98i
	 aFowqXs+FUvhlMd/dGzHLW7ik8IpJYXhOqrBus3TojVneli4S942nmtJI1TZJ0WbPS4n6
	 DuLp+JZambEoVLz5BI2KsUkNSAkMzaCGt1VSK/K/HW2vUFlJ41jNrQu15WxnuYiEBOjGg
	 ITuwOzfVhurcR/Nc8O36YJf9p8KOlvJ2WXOMKa0ESBKw5cHbag8IS8UwfBFtTYMxJ4z/A
	 U9SlDBYp1ngZjX/uoiyReeMyLnSQZSMCPJrq3vo86+BUt62ncQaczvbAtA8bkT5tPKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=loongson.cn;
	spf=pass smtp.mailfrom=loongson.cn;
	arc=none smtp.remote-ip=114.242.206.163
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9454606A32C
	for <sashiko-reviews@lists.linux.dev>; Mon, 23 Nov 2026 05:00:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9454606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [123.138.236.242])
	by gateway (Coremail) with SMTP id _____8AxXdBfyANr5h4iAA--.3971S3;
	Mon, 23 Nov 2026 13:00:16 +0800 (CST)
Received: from [127.0.0.1] (unknown [123.138.236.242])
	by front1 (Coremail) with SMTP id qMiowJBxJs1dyANrv8w2AA--.1962S2;
	Mon, 23 Nov 2026 13:00:14 +0800 (CST)
Subject: Re: [PATCH v1 1/4] LoongArch: BPF: Optimize BPF_CALL control flow
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
References: <20261123043907.20225-1-yangtiezhu@loongson.cn>
 <20261123043907.20225-2-yangtiezhu@loongson.cn>
 <sashiko-outbox-228668@kernel.org>
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <80233b6e-5757-dff6-f0a2-86dd39feb5e6@loongson.cn>
Date: Mon, 23 Nov 2026 13:00:13 +0800
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
In-Reply-To: <sashiko-outbox-228668@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:qMiowJBxJs1dyANrv8w2AA--.1962S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29K
	BjDU0xBIdaVrnRJUUUvIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26c
	xKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vE
	j48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxV
	AFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x02
	67AKxVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6x
	ACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E
	87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0V
	AS07AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s02
	6c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jr
	v_JF1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVW5JVW7JwCI42IY6xIIjxv20xvE
	c7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14
	v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x
	07j8CztUUUUU=

On 11/23/26 12:42 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found no new issues
> in this patch, but noticed 1 related pre-existing issue it does not
> introduce:

This pre-existing issue has already been fixed by:

LoongArch: BPF: Fix the offset of stptr.w and stptr.d stores
https://lore.kernel.org/loongarch/20261118071444.10258-1-dongtai.guo@linux.dev/

Thanks,
Tiezhu

