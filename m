Received: from ultrarisc.com (unknown [218.76.62.146])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AE2C1D5CFB
	for <sashiko-reviews@lists.linux.dev>; Sat,  6 Jun 2026 06:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=218.76.62.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780725991; cv=none; b=QtSGFg8sCcsTayJ6PzqvNZJY47d8rj4bPOWAXWVITEdOKx1gn9VM+4WaxFVNzb75PdKYdGTCtUdqCtbYG0vfh15YpPJJQS+rvA7bDDUyNPrD32OPkE2wPg0RvIIgcel+y+078DFsDjAvRbVOqAXXXcFE8qrAUpkaNutk/qQnFpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780725991; c=relaxed/simple;
	bh=qqDXo+uYr/5IvPcf9pSOsL3u5vxQd4pvbVrNWz+1/oA=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=paAhUPGk6/Yh6Kc+dP1Svzcm3VtvKGo33U/kg6ri8mbm68xc8K7cEhlZbYQGas9c87AqWUD3Tezn9eqa8iLNneqq7EHJNKEeozkVrHPU9Pq1ee2JlX7RJlEGuvHR6LT4yRuj38ymsrHMEDx6wn/EjmdVpSRywHXj3ZuwI3y5jbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com; spf=none smtp.mailfrom=ultrarisc.com; dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b=cvasc9c3; arc=none smtp.client-ip=218.76.62.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b="cvasc9c3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	References:Date:Message-Id; bh=W8reLofs7i9/TLfJM49j3oPOhhw4TfU+0
	726U5kHaUo=; b=cvasc9c3U3xs0rFN48bDmD3dtj2BlN8HWwM8JMGp28H8ehTgd
	L8FhMJr33OkytlujZiDlx8mCs+BfxWgw0+2imhiSwJ5SzJbIcOFcIP9Y9WjOok2Y
	bOxvm+jwEhwJBfroQ9kEDghGvHXlThXMXfMzUWCK0IxHQOQa4S8ezmtaBw=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwA3cUIHuSNqfPAIAA--.8933S2;
	Sat, 06 Jun 2026 14:07:03 +0800 (CST)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 2/2] pinctrl: ultrarisc: Add UltraRISC DP1000
 pinctrl driver
From: Jia Wang <wangjia@ultrarisc.com>
To: sashiko-reviews@lists.linux.dev
Cc: Jia Wang via B4 Relay <devnull+wangjia.ultrarisc.com@kernel.org>, 
 conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260601102233.F2E711F00898@smtp.kernel.org>
References: <20260601-ultrarisc-pinctrl-v2-2-07ac5130a96d@ultrarisc.com>
 <20260601102233.F2E711F00898@smtp.kernel.org>
Date: Sat, 06 Jun 2026 14:06:25 +0800
Message-Id: <178072598572.310568.4489785072318421270.b4-reply@b4>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780725985; l=2153;
 i=wangjia@ultrarisc.com; s=20260515; h=from:subject:message-id;
 bh=qqDXo+uYr/5IvPcf9pSOsL3u5vxQd4pvbVrNWz+1/oA=;
 b=vEZM7cbLnl849Qqgm9NVybEJzT6P6rEtKlLOoIXsCpHose3C4DsWtc1S7I5hdDgVlpKZIeL5r
 RsPCG7hzwFMAj9XsosujISUipWR4j5hkohFv1pr6D7jkh2AgxxcyB0/
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=wGVm18siRScehKOkOz0WKxgxDy7IezHEszhnN4/TUCY=
X-CM-TRANSID:AQAAfwA3cUIHuSNqfPAIAA--.8933S2
X-Coremail-Antispam: 1UD129KBjvJXoW7WrWfXF1kKrWDCr43Ary8Grg_yoW8uF1fpF
	Zaka48CF17JFW5Kayxt3ykC3Z3Za1fAFW5Arn0g34jvFW5C34UCryDG34UtayDCr4jgw4j
	ka4F9ry2ya10va7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUv0b7Iv0xC_tr1lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWUJVW8Jw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxVAaw2AFwI0_JF0_Jw1l
	c2xSY4AK6svPMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I
	8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWU
	twCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x
	0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_
	Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8
	Q_-PUUUUU==
X-CM-SenderInfo: pzdqwylld63zxwud2x1vfou0bp/1tbiAQAAEWoWakYABgAqss

On 2026-06-01 10:22 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The Kconfig symbol ARCH_ULTRARISC is referenced in 'depends on' and 'default' but is not defined anywhere in the kernel tree.
> --
> 
> commit ae98cd11bdead29c422db358de808560e3f3ab23
> Author: Jia Wang <wangjia@ultrarisc.com>
> 
> pinctrl: ultrarisc: Add UltraRISC DP1000 pinctrl driver
> 
> This commit adds support for the pin controller on the UltraRISC DP1000 SoC.
> It provides mux selection for pins in ports A, B, C, D, and LPC, as well as
> basic pin configuration controls.
> 
> [ ... ]
> 
> > diff --git a/drivers/pinctrl/ultrarisc/Kconfig b/drivers/pinctrl/ultrarisc/Kconfig
> > new file mode 100644
> > index 0000000000000..a9257dda5d656
> > --- /dev/null
> > +++ b/drivers/pinctrl/ultrarisc/Kconfig
> > @@ -0,0 +1,23 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +
> > +config PINCTRL_ULTRARISC
> > +	tristate
> > +	depends on OF
> > +	depends on ARCH_ULTRARISC || COMPILE_TEST
> 
> [Severity: Medium]
> Does ARCH_ULTRARISC exist in the kernel tree? I couldn't find a definition for
> this Kconfig symbol. If it's missing, this driver will only be selectable
> when COMPILE_TEST is enabled, leaving it disabled for its actual hardware
> target.
> 
> > +	select PINMUX
> > +	select GENERIC_PINCTRL_GROUPS
> > +	select GENERIC_PINCONF
> > +	select GENERIC_PINMUX_FUNCTIONS
> > +	select GPIOLIB
> > +
> > +config PINCTRL_ULTRARISC_DP1000
> > +	tristate "UltraRISC DP1000 SoC Pinctrl driver"
> > +	select PINCTRL_ULTRARISC
> > +	depends on OF && HAS_IOMEM
> > +	depends on ARCH_ULTRARISC || COMPILE_TEST
> > +	default ARCH_ULTRARISC
> 
> [Severity: Medium]
> Similarly here, ARCH_ULTRARISC is used in the depends on and default directives
> but appears to be undefined.
>

Thanks. ARCH_ULTRARISC comes from a separate series referenced in the cover
letter.
 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260601-ultrarisc-pinctrl-v2-0-07ac5130a96d@ultrarisc.com?part=2
> 

Best regards,
Jia Wang


