Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=218.76.62.146
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792632081;
	b=O6eSFZNH/3qBwRraBmZRSPhK3xaWYrLjGcRJHzdjpVhKxaJe8i5TXg4DNew8q8G92sZf
	 5327vC9ISbLGKJqBd/jYSSjxlY0pxS5CjbPZ/KSE+Eu8m57NBJgWCdEt4tjH4QctoJZOH
	 l4DoD1nwjJJd0W013qQHZVzzKO9s2k8bkMRoHEcflXSAY7EvkGqYTH0Bn0ybVMwce7z+/
	 iSu4jrdkeXl3/C1esJEelBH4jdZfcIwuRvVp+a8mGfQ8j/zumDdc6amWIy66KZp87SUOF
	 ZDRMTL/2YDOym6tkBVm6Nux2iQi30B4pGNFVpHXHxd/GVDb7HnZ446I1uqbYgdMKltg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792632081;
	h=DMARC-Filter:DKIM-Signature:Received:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=0qTN3AxHLAwWcTqSmVVf0t2N2MOT0SaoEmo87MG250o=;
	b=gyzJXNFT2jbzlgfYKGJc0BaNcWFlb2++8ieowwPQBeWToWUVthfS0CQCNMqRTg1N1Xw5
	 qXs3uFMNW7y6UXXpqm6zXzgFpp7Fxv6UMhLUPlLjgt2m4EGyKiRGnci0OWFDdFa6DLid9
	 tF4ZRpJGz+EOebFbw09Cnoi+dBkwwuVSRLrlo7PCUQ6cTfnOeVaOBI3UNfV6NuC5Jxten
	 O29gjYxTB35FMumFp6cD8pS57+3RvuFc1pl6vA7AAxe5sgJErG7+FGvdji0BrYWozC5fE
	 ZsGI77ecIuCqVv94+Kix/OPTzVShHTeqZi9YjE9yXWZNP8dcOF9C7L4MVz1qgkS03AA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ultrarisc.com;
	spf=pass smtp.mailfrom=ultrarisc.com;
	dkim=pass header.d=ultrarisc.com header.i=@ultrarisc.com header.a=rsa-sha256 header.s=dkim header.b=DTRX6B5Q;
	arc=none smtp.remote-ip=218.76.62.146
Received: from ultrarisc.com (unknown [218.76.62.146])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 641F3606A319
	for <sashiko-reviews@lists.linux.dev>; Thu, 22 Oct 2026 01:21:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 641F3606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ultrarisc.com header.i=@ultrarisc.com header.a=rsa-sha256 header.s=dkim header.b=DTRX6B5Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	References:Date:Message-Id; bh=0qTN3AxHLAwWcTqSmVVf0t2N2MOT0SaoE
	mo87MG250o=; b=DTRX6B5QF3PnrWtdgGiJA3vK5nu6JdpaIe9yk04ycRttq8ZbX
	pJs86Vizv21y/ttbLGJf2A7Sou+kpSMnBoMHhmErIIu7xSQY1Ig9iGZlmuV72J9o
	MTsAgn+dxnznBOJQKBXim1J8oiDvEO0EdvTdsJMPgbxQEsr0R4koGffKBM=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwCnYwX_ZNlqe5cCAA--.792S2;
	Thu, 22 Oct 2026 09:21:03 +0800 (CST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 7/7] riscv: dts: ultrarisc: Add Milk-V Titan board
 device tree
From: Xincheng Ji <jixincheng@ultrarisc.com>
To: Conor Dooley <conor@kernel.org>
Cc: Xincheng Ji <jixincheng@ultrarisc.com>, sashiko-reviews@lists.linux.dev, 
 devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261021-badly-issuing-847ac366c9b9@spud>
References: <20261019-ultrarisc-dts-v4-0-3979747cda2e@ultrarisc.com>
 <20261019-ultrarisc-dts-v4-7-3979747cda2e@ultrarisc.com>
 <sashiko-outbox-176776@kernel.org>
 <179246063943.3442927.10941907832509473109.b4-reply@b4>
 <20261021-badly-issuing-847ac366c9b9@spud>
Date: Thu, 22 Oct 2026 09:21:03 +0800
Message-Id: <179263206397.701068.17555028009758516675.b4-reply@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792632064; l=1142;
 i=jixincheng@ultrarisc.com; s=20260922; h=from:subject:message-id;
 bh=YhfSyChms+5lRes9fVBcccuMgzTTh79/WDLxkToqLmg=;
 b=kleQx+9jTfOdcfnpUY69eOlNZYqD9QqdG5uvf881G9EZfRC2q9IzYGAgJVcIxCmGsrnmmRLY2
 kLxl3H+MNkXAVurjMwHDElLYxk+xaEdDAspUhNG8y1P8coVHxQ7gEAP
X-Developer-Key: i=jixincheng@ultrarisc.com; a=ed25519;
 pk=n848dcS5D6g0vLad/rjp4Gf/1eedTe1a3pYUrkt2260=
X-CM-TRANSID:AQAAfwCnYwX_ZNlqe5cCAA--.792S2
X-Coremail-Antispam: 1UD129KBjvdXoWrtw47XF43Jw4DAF4xWry8Zrb_yoWkGrbE9r
	W2kr1kZw45Xas2gasxKr45KFykGayUGF1rAFW8Xw12y34UJFZ0ga1ktr9a9r1xJwsxZrWf
	CrWjvas8Awna9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbI8FF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Jr0_
	Gr1l84ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Jr0_Gr
	1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0
	cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8Jw
	ACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_JF0_
	Jw1lc2xSY4AK6svPMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I
	0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWU
	AVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcV
	CY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAF
	wI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvj
	fUehL0UUUUU
X-CM-SenderInfo: pml0x0xfkh0wg6xo325dul2uoofrz/1tbiAQAHDmrYYSwADQABs7

Hi Conor,
On 2026-10-21 17:51 +0100, Conor Dooley wrote:
> > > 
> > > Because led_parse_fwnode_props() returns early when label is present, the
> > > color and function properties on led@1 and led@2 are never parsed and are
> > > completely ignored at runtime.
> > > 
> > > In addition, Documentation/devicetree/bindings/leds/common.yaml deprecates
> > > label for new bindings in favor of color and function.
> > > 
> > > Would it make sense to remove label from both nodes so that the LED core
> > > uses color and function to compose the standard LED names?
> You're asking a bot that will never reply to you.
> 
> I'd say that if the analysis provided is correct, then yes you should
> since the deprecated property overrides the replacement properties.

Thanks for the clarification and for reviewing the patch. Sorry for
addressing my previous question to the bot; I hadn't realised it would
not respond to follow-up questions.

I'll remove the two LED label properties in the next revision so that
color and function are used for naming.

Best regards,
Xincheng

-- 
Xincheng Ji <jixincheng@ultrarisc.com>

