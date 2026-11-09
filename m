Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794204686;
	b=olwPJDR9Q9Mqg5rp3IMbH8NskuzNRB2dF2Q6ap+Qgga4pNbtFljH3ldoFakQdJNl3iO9
	 RrMDAtWFYyftK7rk04YX81WSP2DRN3pNBB0WQO2nyKrVC3OFcPBzF3E0DQwXFjI8d5QY3
	 VKMCCvpR+KJW+Du73Uq35YHwh9RWY+WIxSc94bT4O6lx6qoJ++cZIIm+o8R11WWdFOKtd
	 l3O2HPlg1a5XzFAw3AyE+czANB4ZEHw6Wsgj8dCgsofS7x1YyAONNeHO1s0bsjJxDDz8R
	 eTbpQkyHs5WAqpgvBmLjwJTy3r42pg+CJOo3RlWlzA0+atwLa0aHTLr52qN7F70XmNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794204686;
	h=DMARC-Filter:Received:Received:Subject:To:Cc:References:From:
	 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:Content-Type:
	 Content-Language:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-CM-SenderInfo:X-Coremail-Antispam;
	bh=xziwzxvyOWMprrTyCMGDw2neLtNo4g5XJ5V/V3jn6TI=;
	b=kFIix3zlJrhXuYRP7H1b9leEF20uxJTb8KMmRWubXZIA15N2lKjKAZNHa54puPDKvbyp
	 SLh/DwY9s4pPlCbM8hs56jP9bH5Ot5SDdP214jbuMGjron8XMpr75gtKsNNNe5G5kvDMq
	 jKf1GZUZ75ac9Yql6oo7bNonpJYAsUl1KBq3KluQ85+mmMeun+92nJFnXvVYFiCgOeDD8
	 Ww3xFS4Md7Vz2c39/yBYNot0D7aeNwLyUj9C7qfykTn+y6pO3ZFR5uCN8pEoQ2L4vyvhU
	 8c/wpHIi+1+zQrH3yBtOdGOon1pe/HnAE3JfxRJ2UZXofXNESngz+xKOvGM/lbck7EA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=loongson.cn;
	spf=pass smtp.mailfrom=loongson.cn;
	arc=none smtp.remote-ip=114.242.206.163
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD1E3606D83C
	for <sashiko-reviews@lists.linux.dev>; Mon,  9 Nov 2026 06:11:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD1E3606D83C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [123.138.236.242])
	by gateway (Coremail) with SMTP id _____8AxS_ALZPFqiLkdAA--.20298S3;
	Mon, 09 Nov 2026 14:11:24 +0800 (CST)
Received: from [127.0.0.1] (unknown [123.138.236.242])
	by front1 (Coremail) with SMTP id qMiowJCxtMwJZPFqQB8zAA--.12340S2;
	Mon, 09 Nov 2026 14:11:21 +0800 (CST)
Subject: Re: [PATCH bpf-next v2 2/2] selftests/bpf: Fix unaligned access
 failure in fexit_bpf2bpf
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
References: <20261109041207.15221-1-yangtiezhu@loongson.cn>
 <20261109041207.15221-3-yangtiezhu@loongson.cn>
 <sashiko-outbox-204400@kernel.org>
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <04eb9e18-205b-e460-c1dc-7f0abf7c4533@loongson.cn>
Date: Mon, 9 Nov 2026 14:11:21 +0800
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
In-Reply-To: <sashiko-outbox-204400@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:qMiowJCxtMwJZPFqQB8zAA--.12340S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29K
	BjDU0xBIdaVrnRJUUUv2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26c
	xKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vE
	j48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxV
	AFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E
	14v26r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44
	I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2
	jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62
	AI1cAE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E
	5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUXV
	WUAwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY
	1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI
	0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7I
	U8oGQDUUUUU==

On 11/9/26 12:17 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] selftests/bpf: missing Fixes trailer for commit 6dc03dc71387

...

> [Severity: Low]
> This fixes the unaligned packet offset in test_pkt_write_access_subprog()
> and new_test_pkt_write_access_subprog().  Should this include:
> 
>    Fixes: 6dc03dc71387 ("selftests/bpf: Add test for freplace program with write access")

I will add Fixes tag in v3.

Thanks,
Tiezhu

