Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795503539;
	b=X3wbc+hUh5tGrer1z6+yQ3T3W1DVK/bOKFWgLu5zpNMANGABZ42kKXqAaGBmFJKCSYzz
	 nGic/YCy4cZFoTChrsxVi+pL7FvQwutLrw/GqBnWTkcm3qg539x26F5hSki4bWNVPO2zJ
	 5dFjO+fzG4e5jtT/s3BfXqC5jASEWZnS+nhNFtEFZ22ZDDh2ph8v+HQAWQTOBKPzVbfoI
	 lvZntdHxcpYV9r8VBX5MUxcoWRefC1L67arKxv6sTTUIDibC6Gw5euNm5z90DEj0WYYwO
	 UXbFvEaxMwMwh1Zi6VgUfAN0BKarJ/cUKzX22xjHrLLs9jpO7VTAlIZQY/qWii2Klgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795503539;
	h=DMARC-Filter:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-CM-SenderInfo:
	 X-Coremail-Antispam;
	bh=0c/o13VUmTtvta2hEpnHq2PWiO16Lv/Z0jbNybTWp4M=;
	b=p9jwRQ35zzhclj/D+pFhIPA9GBUnE1PoboafJE6mPxhjo/iA4e5hZ6AC84JDDyEG167M
	 VLToDzx25H8yRUCTVvNvyck4ojIoUqH2C74Q3QeCTnxKVDZjY1TVOOdJGjFo1+GWsbYUM
	 Ld54DQU3ZeE7tHVKJ9gWkhvsiTnSMtZz6oid4fBmfqyGKwQctjjn9n/IQX5wELwKAKL5s
	 CMlRNDlLfW4CEMm44M+PucALyaes0ASLUhaaVmjrPyolm/EyJcylK4Mzudzz4kokBBMs6
	 XbbhWroPaLKSvH1cbC3dh0Nc0qiR2btv4cQGOe9j9dm4e928EaiE6ILrg65jZh33nUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=loongson.cn;
	spf=pass smtp.mailfrom=loongson.cn;
	arc=none smtp.remote-ip=114.242.206.163
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E82B6606A321
	for <sashiko-reviews@lists.linux.dev>; Tue, 24 Nov 2026 06:58:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E82B6606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.69.66])
	by gateway (Coremail) with SMTP id _____8DxytGpNQVrynoiAA--.32226S3;
	Tue, 24 Nov 2026 14:58:49 +0800 (CST)
Received: from [127.0.0.1] (unknown [223.64.69.66])
	by front1 (Coremail) with SMTP id qMiowJDxRs2gNQVrtgI3AA--.31052S2;
	Tue, 24 Nov 2026 14:58:41 +0800 (CST)
Message-ID: <0009e3c5-dfff-4254-a06f-13c8664a1543@loongson.cn>
Date: Tue, 24 Nov 2026 14:58:40 +0800
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
Subject: Re: [PATCH 2/3] dt-bindings: serial: 8250: Add dedicated
 Loongson-2K3000 UART compatible
To: Rob Herring <robh@kernel.org>, sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, linux-serial@vger.kernel.org,
 conor+dt@kernel.org, Binbin Zhou <zhoubb.aaron@gmail.com>
References: <cover.1793776192.git.zhoubinbin@loongson.cn>
 <c194b5248184779da500476281fd411fc80a98d6.1793776192.git.zhoubinbin@loongson.cn>
 <sashiko-outbox-196836@kernel.org> <20261119214532.GA757146-robh@kernel.org>
From: Binbin Zhou <zhoubinbin@loongson.cn>
In-Reply-To: <20261119214532.GA757146-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:qMiowJDxRs2gNQVrtgI3AA--.31052S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAgEBCGsFAH8DMQAAsp
X-Coremail-Antispam: 1Uk129KBj93XoWxZry5uw15CF1DtFW8Zw18JFc_yoW5Ary5pF
	ZxCa97KF1jqFnrW34vv3W8Aa18XrWDAF12kr4UGr12yF95J3yftrW3Ka1YqF4xAFy8JFW8
	XFy0gFW8GasruwcCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUyEb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE
	14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCF04k20xvY0x0EwI
	xGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
	Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7
	IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k2
	6cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxV
	AFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU1EksDUUUUU==

Hi Rob:

Sorry for the late reply.

On 2026/11/20 05:45, Rob Herring wrote:
> On Wed, Nov 04, 2026 at 07:52:04AM +0000, sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>> - [Low] dt-bindings: serial: 8250: duplicate ns16550a fallback block for ls2k3000
>> --
>>
>> commit 71974153fe22bc00d365059be9198364c9cfaa86
>> Author: Binbin Zhou <zhoubinbin@loongson.cn>
>>
>> dt-bindings: serial: 8250: Add dedicated Loongson-2K3000 UART compatible
>>
>> This commit documents the loongson,ls2k3000-uart compatible string with
>> ns16550a as a fallback so the driver can distinguish the Loongson-2K3000 UART
>> from earlier Loongson UARTs that require MCR/MSR signal inversion.
>>
>>> diff --git a/Documentation/devicetree/bindings/serial/8250.yaml b/Documentation/devicetree/bindings/serial/8250.yaml
>>> index 01abd39509a7a..33c13c48ed56e 100644
>>> --- a/Documentation/devicetree/bindings/serial/8250.yaml
>>> +++ b/Documentation/devicetree/bindings/serial/8250.yaml
>>> @@ -196,6 +196,9 @@ properties:
>>>                 - loongson,ls2k2000-uart
>>>             - const: loongson,ls2k1500-uart
>>>             - const: ns16550a
>>> +      - items:
>>> +          - const: loongson,ls2k3000-uart
>>> +          - const: ns16550a
>>
>> [Severity: Low]
>> This isn't a bug, but properties:compatible in
>> Documentation/devicetree/bindings/serial/8250.yaml already has a two-item
>> block with const: ns16550a as the fallback that includes the other base
>> Loongson UART compatibles:
>>
>>        - items:
>>            - enum:
>>                ...
>>                - loongson,ls2k0500-uart
>>                - loongson,ls2k1500-uart
>>            - const: ns16550a
>>
>> Could loongson,ls2k3000-uart be added to that existing enum instead of adding
>> a separate two-item block?

Let me briefly explain why Loongson UART `compatible` is necessary at 
this time.
First, as described in the driver, each `compatible` type defines 
different driver data:
struct loongson_uart_ddata {
         bool has_frac;
         u8 mcr_invert;
         u8 msr_invert;
};
Since the Loongson-2k3000 has already fixed the hardware issues with 
mcr/msr, we need a new `compatible` to correspond to the updated 
`driver_data`.

static const struct loongson_uart_ddata ls2k3000_uart_data = {
         .has_frac = true,
         .mcr_invert = 0,
         .msr_invert = 0,
};

As for why a fallback to `ns16550a` is required in all cases, the DTS 
files for the Loongson-2K1000 and similar devices were merged into the 
repository before `8250_loongson.c`, and this approach was used at the 
time to maintain compatibility[1].


[1]: 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=13532b5186a7aa4dfd9885355c6af7562b75dd7f
> 
> Sashiko is correct. Please address this comment.
> 
> And please answer sashiko comments before the maintainers have to.

Okay, I'll keep that in mind next time.
> 
> Rob

-- 
Thanks.
Binbin

