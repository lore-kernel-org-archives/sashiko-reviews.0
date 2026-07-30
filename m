Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C548F3859C2
	for <sashiko-reviews@lists.linux.dev>; Thu, 30 Jul 2026 08:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785399504; cv=pass; b=uu1bRK7u/qc3OGw9CIOh2uoZM+k/llF/uhTVxuG3xP8B0WqEYM1AeIKGL+t3wvhBRccC5+bKOiV7DQbl8JLUO0mKIVo7ljYm5F0xsi1aZ36k6BY88gdaAzdMeekKiTFefknQtsNQzSL5EpbX1HBT2nvRfN1GcC3RCG/awB3ESmA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785399504; c=relaxed/simple;
	bh=f7QRhfPhfuanj85ZYxwPDOHyrGPoaNqQTqn4TimE2bA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BbO3zcoaBXZTx3TbkfaLeof4CCw4mJu2c6WGX10uDhZqWZwS9szRDoMm1mTz7nH/dPcz+3VwDjWZviFpa9NcZ2MvpaRchm4akZ49yOXGwCi3BfmnMgfSdvGUIifiO+xL5L0RGJkw3HE06F+FhdVsd4h9YzF5J1pdCk6LMv0p1fA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nearthlab.com; spf=none smtp.mailfrom=nearthlab.com; dkim=pass (1024-bit key) header.d=nearthlab.com header.i=@nearthlab.com header.b=WcrlB+gV; arc=pass smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nearthlab.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=nearthlab.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nearthlab.com header.i=@nearthlab.com header.b="WcrlB+gV"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2d004f135b1so25561945ad.3
        for <sashiko-reviews@lists.linux.dev>; Thu, 30 Jul 2026 01:18:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785399497; cv=none;
        d=google.com; s=arc-20260327;
        b=IGBOn6T9O9ZuiTW9tYCQWnmaNSyZajqrLgqawPCE6m38efnHKiJcGKmGD53iBkYIL5
         zD0deFzwJ/20Nc+oSvZHnulsGPlEoNox6bZfursvN2hA9cqVhJTi50pIf8z8iku+J2eb
         GKbPPoB8u85XYhBHg8vyFFwDFIgK98Vdpu7/8UME/lySw3/gNQXhlNzcJU/HuNZd1U55
         QbBqvYfUurs72uH/3ZyJ6mD+vnZzWwiJMszqM6olcksDQP50YMXtNOzrICxPOYhEvA4I
         uBI0aB7AFqTu5OVBEMJujm2ZA43f2wuzhMdK37ET740Q8B/Tgr6aOZfGqPLjOP1dLr/k
         cAGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=is1ZQk2S8/kibmO+4EhDqlrn7RhSaBF98AwRFvKrWvM=;
        fh=2E8G5L5HRIhYv0SLHRh0bmuG4bK/RxhrEd6+zC1U6gY=;
        b=s/mloa2WW44I7C2n0EuPzQWpGMR8enZFg4tKwvF6/Bty05nM0Jaj4l8QvnI4rHBsys
         llJh8z3ihFPMk9AR+pSgF2gfDNVOly8Mdzt/Wh4HmGp3CEF4L1zt4T1YM/SC/NBCp4Is
         oeozjwgAe+fMFb0zdfO3ejO5YHyA0CAV/AbRTVEwg65rcztD+e7wc9XksDR/zn4S9v/0
         MuwP2z52wZ9yEqhw6ASQjJHT+KO2UgZuLkG1VlMLK6YQCEHREVJoGxJIUgqmEbFiQKs3
         LC63CnCDnKPzBAX2t7eDNoqYKzLPBcF7G/Ugd36FPYDw/Vsv5E8IeItn29VjW7R/ZV0m
         Uc4w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nearthlab.com; s=google; t=1785399497; x=1786004297; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=is1ZQk2S8/kibmO+4EhDqlrn7RhSaBF98AwRFvKrWvM=;
        b=WcrlB+gVoVp2c2SSu/m07BnUXcUE31yF4hAA3qYImEjZvN8wWSVfQBaNEipYeAinmt
         CmnY3taRFB1O0XEN5NSHpErhPEU+YUnkBEYHExRQXwrw3qdH5oXV3k2UiFQ3r7WN1/u8
         Qo8T1tvOLrP+svLnJtMBPINeHfFLxXrrSjTX8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785399497; x=1786004297;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=is1ZQk2S8/kibmO+4EhDqlrn7RhSaBF98AwRFvKrWvM=;
        b=kMRYdhFmR5xCgOu233P8sTLt2BPED14ZhEVp7A3hXdJK/BaH0/exsJq/j3RxzF6p5f
         7qCXE6Xfp8KoCD483GSRhQGz8hQPRX5TWCzyJmMZMvnIVpwg934DubFoUcBASNkevl5K
         DxaGdd87ApbpTqt4O/aFQAwmjGW5fojiV4VkIUt5Ob1mPB1jwFEwAOxmRyD5jk+etOpH
         X1ZrPFc+YKStKn6ZXIynjHV9H9GZUB2+Mn6I/IF0mHxOi+HELlSPDRNAp0sNjcdbCcjf
         uiPInOfSE5QGuu5M7Ze/8StsoR/Iskz4R93KO14CyhZVc0mwEYpIz6I3VV8VWhXWwcc7
         M9cA==
X-Gm-Message-State: AOJu0Yz8Y+AozMS6YzsKfGMmxF9l7+cKfVTY1RmBc8bqvh//7F8pImpl
	mbBrsAb4MBJUnbm/l9mk0bDEhG62AOrH1GtyDa3pkBkuFyOIcqTkx0r05fHHqyCbrTDV6XJtpDJ
	vHnZJjMyxcpb8WZv5lgMapnDoD+HsBPljve6fqbmax4VM2QgqQJ9I
X-Gm-Gg: AR+sD10CE55ZliR3ugtufIz8oZ01Toc+EMz4YwUgYY2zPt23otOol/coneMiTrEmiDt
	XSH3KVM+kdJ+RC07Q7asqpp4y7H8edF9SaZPf1jIug0YnmGPbtCHQMeOw/iNWAG9AXlyFpdBK9T
	JSNmfTpt+8VTT3AWhErmviLiGEAlGZqtnNdvGcePH9m1WUeo75GPyoZq1rF1yLNNCb9dBqtt2H0
	vjuT1aNa4KpGpxpFshGYHNw44nZ21GECPfWlGBsGudiYRPZ43WrD9Lu7EOk30cJMrdw9fzd5zCh
	o34+bX5c+UrSgdxhX8Bapz+1FcA4qVlgCpU4W4SpWiyWvw==
X-Received: by 2002:a17:902:cf0e:b0:2c9:fb11:1bf4 with SMTP id
 d9443c01a7336-2d035b89e1emr17737995ad.7.1785399497022; Thu, 30 Jul 2026
 01:18:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260730072215.2090974-1-sangwoo.han@nearthlab.com> <20260730074626.BED8B1F000E9@smtp.kernel.org>
In-Reply-To: <20260730074626.BED8B1F000E9@smtp.kernel.org>
From: =?UTF-8?B?SGFuIC8g7ZWc7IOB7JqwU2FuZ3dvbw==?= <sangwoo.han@nearthlab.com>
Date: Thu, 30 Jul 2026 17:18:06 +0900
X-Gm-Features: AUfX_mxYgeKuB9t87txmyP8OggIl-yRobUNT0qaQCA1nud0Zwhpc-Uj6JPiYNXM
Message-ID: <CAFg7d9b4yLH+s1KZC3q0zOxEvMpAQgMxoNEFKtgKmBzQXFqfjg@mail.gmail.com>
Subject: Re: [PATCH] PCI: brcmstb: Reserve only the MSI vectors that are
 handed out
To: sashiko-reviews@lists.linux.dev
Cc: linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Because bitmap_set only reserves exactly nr_irqs bits, the remaining bits in
> the device's hardware window remain marked as free in the allocator. If
> another device is subsequently assigned one of these trailing vectors, can
> the first device's interrupts be incorrectly routed to the second device?

No. The PCI/MSI core masks every vector the endpoint is capable of and
then unmasks only the ones that were handed out, so the endpoint cannot
signal the trailing vectors of its window.

msi_capability_init() masks the full capable range:

  /* drivers/pci/msi/msi.c */
  /* All MSIs are unmasked by default; mask them all */
  entry = msi_first_desc(&dev->dev, MSI_DESC_ALL);
  pci_msi_mask(entry, msi_multi_mask(entry));

And each allocated vector is unmasked individually:

  /* drivers/pci/msi/irqdomain.c */
  pci_msi_unmask(desc, BIT(data->irq - desc->irq));

This is observable in config space on the endpoint I tested. With 5
vectors handed out at hwirq 0x8 and Multiple Message Enable programmed to
8, the Mask Bits register reads 0x0000ffe0: bits 0-4 (the vectors in use)
open, bits 5-15 masked. Messages 5-7, which would land on hwirq 0xd-0xf,
are blocked at the device.

Reserving the full power-of-two block does not provide isolation either;
it just never releases it. The irqdomain core calls ops->free() once per
vector with nr_irqs == 1, so bitmap_release_region(order_base_2(1))
clears a single bit per call, and roundup_pow_of_two(nr_irqs) - nr_irqs
bits stay set for the lifetime of the controller. That is the leak this
patch fixes.

irqchip/gic-v2m.c and irqchip/irq-alpine-msi.c already reserve exactly
nr_irqs this way. For instance, gic-v2m moved to
bitmap_find_next_zero_area_off() + bitmap_set(nr_irqs) in commit
2ef3886ce626 ("irqchip/gic-v2m: Handle Multiple MSI base IRQ Alignment").

Thanks,
Sangwoo
