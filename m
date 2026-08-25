Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E6F33A70A
	for <sashiko-reviews@lists.linux.dev>; Tue, 25 Aug 2026 10:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787655319; cv=pass; b=r5TSCPTxw9iGtFxpRdeiStEMtifx+DVFM2d3sYFuhTOKntfpozaZC9Sxl8p7fECpYGlLoa81TmcZg0VD+NNF2RzXrChWzTbVO1TRHRdYrUr2NygyBnocmwyWtlhwc3aD6CN3Urc3eGmNV5TpJnPoW8Zf938mIrv21PjLAhqEypY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787655319; c=relaxed/simple;
	bh=YjhBNYLp1+JOi4PAwGzdbKWKT1rkCzEPvCpcv+Z302c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jAV9qBm8+UFgIdOJBsyM90zWmWD0GCbIiVQcmFZyzYxlCbK2Qobo7M80YMXEKMn2QXG4e0lrBedTZP1HJxU4UksGLrUefY5z3IWxFdAXK3m/Zq1mkhKHTzfjomfkOu/zS1C+PzhwRj5fVFqvI++TtGwYCqG/nm5gIcqenf/G2rE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f3NM8rJh; arc=pass smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f3NM8rJh"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-84847482584so484462b3a.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 25 Aug 2026 03:55:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787655317; cv=none;
        d=google.com; s=arc-20260327;
        b=NkDxNElh83XPdOBShAism3FSZkH16UuiOjjTSjM/ZhIS7ruYG3tpp+Krqs13+kczGb
         J9gztkx3EY4t3bhuBT6she50zBoy1tta2YscVL0hRUJ02L6jMj5OXLV74Aaky0tlEdu8
         PH62SfUJM5pEHs2ABs5cs2CFCTTr2DSe3S2VveJWFMEEazS+neuXwN1Ina6dpL/BZlKN
         j0jnoJKccqhIOHMvRDsQQgnzNMHQ+pv8Ph/S9CcqtyUq8Ai6b+Fe90zA20k94puLlA3W
         IygCJ4sRjU0S8Ir9XUW3UiCbDICkvDpfQVfgPig0bclqNIbB+cDZm2WeoNtm+CO7wBQ3
         qUHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=0HHXpTM+gQhoNIJQAMx/pYhBXi6CPIRaEt/OoWjkNVY=;
        fh=DHjdiazyXdowSKc8QFJ0cQPiw6JytCzKGsbsz5/ouWo=;
        b=RIfQTpea27n1F0VSSdB0BvXEi1MJ+CK7T0Mg9FxWd+9IWOiTd2jpH0HALldZGNMXM+
         AJrxhpBDHoHdGasRVN6fiGcDB0MaCDtiLMMfjmVwzsxsbI6kLZgvuuROOHCSwn2gjVFz
         /E3PAcPQOnmOozv8ugRpNpMTHT6PpiOJZE1jMlHa2d6XpQceTCuOuG8Jpk6TBPR9Kzp6
         Wr0rqTdh8urc0YJk7yRwoqmV7ZdpACJ1PI/g7hFM90dP495ThMTCYyQvscWiBaq23Yyf
         uBt26Qzf99jSUObrEVwwI2l3jMhH/06x8Ez+qnDeaRm5oh2MKKtBZ72H/707grMTWUpL
         p7Rw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787655317; x=1788260117; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0HHXpTM+gQhoNIJQAMx/pYhBXi6CPIRaEt/OoWjkNVY=;
        b=f3NM8rJhKrAzDDvVgwdUVLAzrRfqBx75HeWdonpxiLJYgpzXqggy9Y3rM8wJOgG1Ty
         2ee25IGcUhn1vmJ1L2aeAGn0bSv2jdmbdKlTUS9l+cKEBfHFnchmA6bG4ilScHpDlLBE
         3BRJGTFbWddjeMZNjtOV3qACjJsrxz0uIHaKn8O+FDCawSrQIHDXQe7GVnpaU1787QpP
         k7yP7XoVZKYLnz+lCkjaGtYTgz1cQXCqRmrMJQhPaAnnxxMMVJAba+nVCIkZqxXoGQ9y
         ZfeNb4rse8syM0rjQSPH5y9ZFqrjBL49fyt60oKCPu4sCnfTsMNf8gY2mIUhP5Stbaxb
         i4ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787655317; x=1788260117;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0HHXpTM+gQhoNIJQAMx/pYhBXi6CPIRaEt/OoWjkNVY=;
        b=qU1E1NDWoOKT0ptn8SfIMFcoEeVrJS8N1BCTtG4B8/Lx/oKQGrttwLQpCCCBK0WWoy
         Sza8g1tiSp2PFgo6P4HwmEajNFW+upjYy6KzGBpUPt92Nsp/Oy5pge4CwAVe6PIty1HY
         VUBnCxVobydFj1ELtTkB1zURL/jnY5lQTdleRPUAoxN+212wLXnpnHEAQ9uTlrETsptk
         oVm0E5Mo10G3Voq7l1Jgf4fXqvJtzmplOsk/P44QPkBPIEPz3UxxEv6qOmgJahpY4Ttz
         74+TbkMCXc117y3eUP5xN/zbqMmyC0BH79qCw5wCf0plra2Ri+6YJSsG6aTuudbYtX6P
         DexA==
X-Gm-Message-State: AFuF++m5qnwWjGwBGMgUXVdFl3LpWdcz7OWfGKa8m2LSLDCbnumIcR/T
	SstP/+bHBTfMjgE1+v4GjH4rzfqaTqVb+oXK6MtPNiZdcNR6/ZlaABmSUs3qr//DfYll/B6Wc0G
	P2AHR3bXNmnfKs6Q8fcG7ZgIpu5qAgZYPVAc6
X-Gm-Gg: AR+sD10SJGHR198TzjZWxOstjlYqOm8x/MkMOLCbtcflksW5NNZSy277qskZyCxhKzB
	W6FkfHAuzdvG5klQwbkk5SZlLBxhnLsLPo6dSjJBSZr9yU4cl0yWdTnUpaot4PeIGEoiaXq/w/Q
	hL7DpbUL/XqzAU7MwZXFWxF2y7/l/BaHfGCPB7jdwkTAy1LdFzNQgsnQ+93dhiqERxNoADKaEwX
	9sdtJnbKXYEKerY7w05tHIHbPG7CT1tuO5nEBZHU6R9VKOdvoHzY5Vfxke+/EE3spF/m7iCGEL8
	ZLvyZtRaXHmrx+9WqswJYIpKBylXoHMfTp66ca2+JXcTofBtsT7R/qni+Y+1cqqKOXemuDz1ZHn
	kMygjsjXw+1D+Wv4lgZq+CXQTE4gfY3PNgqj+s0s0s9sB6nFSRPNYVM/G
X-Received: by 2002:a05:6a00:18a1:b0:84a:32ba:a262 with SMTP id
 d2e1a72fcca58-8523baee6a0mr6196886b3a.7.1787655317063; Tue, 25 Aug 2026
 03:55:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260824100901.31675-1-phucduc.bui@gmail.com> <20260825100929.5F3D51F000E9@smtp.kernel.org>
In-Reply-To: <20260825100929.5F3D51F000E9@smtp.kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 25 Aug 2026 17:55:06 +0700
X-Gm-Features: AcwNN1XO-UxS2toBrwsjemVQr3JZE7SN6j1yX-KK_iflO1nCuB3BirBvu27LfcM
Message-ID: <CAABR9nE5eWgOXEnpquG+KoLPL+KC93_2cgv3gNVsWDEfyA9d_g@mail.gmail.com>
Subject: Re: [PATCH net] net: ethernet: sun4i-emac: Fix IRQ error handling
To: sashiko-reviews@lists.linux.dev
Cc: linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

> Pre-existing issues:
> - [High] Unconditional call to `dma_release_channel(db->rx_chan)` in the `emac_probe()` error path can cause a kernel panic if DMA configuration fails.
> - [High] The driver unconditionally enables MAC interrupts during system resume, even if the network interface was logically down, which can permanently break the interface.
> --

Both issues are pre-existing and are not introduced by this patch.
I will keep the scope of this patch limited to IRQ error handling and
will not address these issues here.

For the first issue, the cleanup could be separated so that
dma_release_channel() is only reached after
successful DMA configuration:
---------------------------------------------------------
-       if (emac_configure_dma(db))
+       ret = emac_configure_dma(db);
+       if (ret) {
               netdev_info(ndev, "configure dma failed. disable dma.\n");
+              goto out_dispose_mapping;
+       }
...
       if (IS_ERR(db->clk)) {
               ret = PTR_ERR(db->clk);
-              goto out_dispose_mapping;
+              goto out_release_dma;
       }
...
+out_release_dma:
+       dma_release_channel(db->rx_chan);
 out_dispose_mapping:
       irq_dispose_mapping(ndev->irq);
-      dma_release_channel(db->rx_chan);
------------------------------------------------------------

I will not include this change in the current patch.
These issues would be better addressed and tested by someone with
access to the hardware.
