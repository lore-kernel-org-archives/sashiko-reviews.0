Received: from ultrarisc.com (unknown [218.76.62.146])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93D693CF69D
	for <sashiko-reviews@lists.linux.dev>; Wed, 20 May 2026 09:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=218.76.62.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779270620; cv=none; b=AAWDrvYSPxx2gVAAoLG9ht42LaVwueoSGcNHqLRRAW9FnAd9dZore+dcTYh7EIXprIcJZ6Tw4XN1XJxCNawaUOFeCkqhF6eQDMGKQSzjtNjX3K87MCDczSd6YsbBxBHB4aBqpLLCBwwx9DdfMVfr38vvA4uB1RNmvMg2V2rrOoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779270620; c=relaxed/simple;
	bh=tbZBdoarp2sMNF7McNT4lu1FRi1CirgdzAxImMKKYNQ=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=Xd+CgByVCGG+YtOgkYmjU9Rs/dGm1tBDGNfHuGf4IhDCiCUXF65UnpAfqubybvu2BkduUBcazhcVk0mKkFa0ErrEe9UCUAdHycrNJAFn8FMByGUigBQ8jnsY2iMCriJhAiL2OVeSKJ20nU8ihqKROuzwD+HAWrPiXXkxNB5oOKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com; spf=pass smtp.mailfrom=ultrarisc.com; dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b=Uig7OxAw; arc=none smtp.client-ip=218.76.62.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b="Uig7OxAw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	References:Date:Message-Id; bh=TbLDLhyU9bxJ7UXpA/7PbPwCImZmP1A41
	0Qyc+w2VoA=; b=Uig7OxAwl2XqIC6rhfooBYdmnLWpfg5DFR5OEIoGnX8mFu3cW
	6785I6Ep6fxsxKBPbqro74cbyjzZqTg7up3KMULChj3fIMkMNzIjFGE82lo4vsS0
	Df/bDeea7k0j3DHPRjaxlm9Jwpw/xvzh2Ku4i7iONz/6W5jvacZHM2jYK4=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwDXEELdgw1qZ_AEAA--.6755S2;
	Wed, 20 May 2026 17:50:21 +0800 (CST)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 9/9] riscv: defconfig: enable ARCH_ULTRARISC
From: Jia Wang <wangjia@ultrarisc.com>
To: sashiko-reviews@lists.linux.dev
Cc: Jia Wang via B4 Relay <devnull+wangjia.ultrarisc.com@kernel.org>, 
 robh@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org, 
 conor+dt@kernel.org
In-Reply-To: <20260515025935.36F07C2BCB3@smtp.kernel.org>
References: <20260515-ultrarisc-pinctrl-v1-9-bf559589ea8a@ultrarisc.com>
 <20260515025935.36F07C2BCB3@smtp.kernel.org>
Date: Wed, 20 May 2026 17:49:40 +0800
Message-Id: <177927058085.943957.1239618570843676347.b4-reply@b4>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779270581; l=1741;
 i=wangjia@ultrarisc.com; s=20260515; h=from:subject:message-id;
 bh=tbZBdoarp2sMNF7McNT4lu1FRi1CirgdzAxImMKKYNQ=;
 b=Qk6zp9Om2sePZWG2IwsvFdWLSR79H5DetARYG8n+U2MtlsFyvt+LaRxWWVB29V5KzjHsrJXTZ
 twykCUYa0OiA1Ssn+8oV64Kc47sTjF8Rv1hkeOiDgro2B1eJkD+Zj+6
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=wGVm18siRScehKOkOz0WKxgxDy7IezHEszhnN4/TUCY=
X-CM-TRANSID:AQAAfwDXEELdgw1qZ_AEAA--.6755S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ur47Ary3Ww4kAF48Cr1kuFg_yoW8AF4Dpr
	s8JF45CF1rGF1rGayxArWku3W0yws3XrW5Jr1jgr15ArWfu34xCrykKw42g3Wqgr9rWw1I
	kF9Yk3sFyw1UA37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvYb7Iv0xC_KF4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Gr0_Cr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkF7I0En4kS14v26r126r1D
	MxkIecxEwVCm-wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c
	02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_
	Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7
	CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v2
	6r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07
	jFhFcUUUUU=
X-CM-SenderInfo: pzdqwylld63zxwud2x1vfou0bp/1tbiAQANEWoNL8UAJwACs1

On 2026-05-15 02:59 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The Kconfig symbol `ARCH_ULTRARISC` is not defined anywhere in the kernel tree.
> --
> 
> commit c77ace3a44699f903221665a56d7714a8cd6cf21
> Author: Jia Wang <wangjia@ultrarisc.com>
> 
> riscv: defconfig: enable ARCH_ULTRARISC
> 
> This commit adds the CONFIG_ARCH_ULTRARISC symbol to the default RISC-V
> defconfig file.
> 
> Link: https://lore.kernel.org/lkml/20260427-ultrarisc-pcie-v4-1-98935f6cdfb5@ultrarisc.com/
> 
> > diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> > index c2c37327b9877..9fdc4d1831ed9 100644
> > --- a/arch/riscv/configs/defconfig
> > +++ b/arch/riscv/configs/defconfig
> > @@ -32,6 +32,7 @@ CONFIG_SOC_STARFIVE=y
> >  CONFIG_ARCH_SUNXI=y
> >  CONFIG_ARCH_TENSTORRENT=y
> >  CONFIG_ARCH_THEAD=y
> > +CONFIG_ARCH_ULTRARISC=y
> 
> Is ARCH_ULTRARISC defined anywhere in the kernel tree?
> 
> It appears that the Kconfig entry for ARCH_ULTRARISC is missing. Adding an
> undefined symbol to a defconfig has no effect because the Kconfig system will
> silently discard it during .config generation, which would prevent the
> intended components from being built.
> 
> Was a prerequisite patch that adds the ARCH_ULTRARISC definition accidentally
> left out of this patch series?
> 

The ARCH_ULTRARISC Kconfig definition is in the patch referenced by the
Link: tag in both the commit message and the cover letter. This defconfig
change depends on that patch.

> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260515-ultrarisc-pinctrl-v1-0-bf559589ea8a@ultrarisc.com?part=9
> 


