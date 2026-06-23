Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 234013AB26D
	for <sashiko-reviews@lists.linux.dev>; Tue, 23 Jun 2026 06:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782194730; cv=none; b=qMH6d+czMIXNNTgjjjNsnsbvo043UpDKJbZRZSq8cK6xFXKaCb6tm3pXrA8bhFcM9DIkPTFgiWzJwQJ4oO9o/5PeW5BMWNRB9rIf1RBPBxMM4h31EXb8v3S6yOH29YwpbRaYx6oeBJCPXlE21uwZZPnRNGaLzFF4KrLOIo80cVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782194730; c=relaxed/simple;
	bh=X0Nc3LPeP3yvoTzuOeTi8HsCjRqSR9NDjqFs9CJsHhs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QBC7XaCbk/QUfbkv03CbDUye/qXgM9YWAm6Lwz/T3nXga5Z4w6ReFk4a4Jto1f9xqinSRRx7C4hn9aZBK2HUSVZulwt+wllzxUV/f5j6zMCYnaHDUkykXXnWlj6T80oWBO1ahnusAjhHeQZfxxS3eVS6YmDRZWNGRm2pFkds2f8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F/rAdwoG; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F/rAdwoG"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8422f395a4aso395198b3a.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 22 Jun 2026 23:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782194727; x=1782799527; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Ef21YKNRKTwE4+JoXHQ8LZhCHi66wbfOD/5s58Gc8o=;
        b=F/rAdwoGgN/ebz0zurz1pSh80TxDrb4Qn22jhClV40nEDqZ9YoD9eOKHH3zr/Y8+IG
         65BbgT5KGP+K85Ze8KaLvxkXWgd/1NVvhD2Ws8OdzvK3psVbwf5pwxPzxD/r2NC3JRN1
         VkjMD2yBoBXY8UAWkMwikCVYqPhRRNKKEjbNXDdt5PDr8IHHSCrk9Enfin4VDKX4ezLc
         KaZTwu5AAPHcvXdJP22Vb/ERB3PeXFw/X819KRI97lX0PJ2uAA0sq6Z+KEqG6Xbxvb27
         kqqNnDKH3KfJurLeAvo5rPYlNy7r0aNRAnIicpY0ytk9BO9D4OCT27UamEMQ4EmbF9qK
         cdBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782194727; x=1782799527;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2Ef21YKNRKTwE4+JoXHQ8LZhCHi66wbfOD/5s58Gc8o=;
        b=W1TUqo3wt0maJBaXmhrqLX3uf2FwO6xjJUpnSRiF52HxdabJ6po9ZVoqYm/IEK7nrf
         CaF+wyYXwjNJ3OcsAUolGkiKep1tuIP3Gzso9pBJCTOEbSy77mWEIRIzZfxC+Zfj66Jf
         tICYCgy2UJy53AVTIXgSv2huuE2GCJj6Zr7hR1He0dlRu0SV2g0zuzrEXoXbZSvxXRrt
         QO/pUzV0mwN901JX2naAe3B+x7sZZMFQdthlFa7vercrvhtIV173PBL6djULQFeMOjKG
         EYFA5TPnw9rbEBprUlAlbhiDSxmrYP13t1fQOwBYGfE4wjhc+7R4sqXzVAM0pBj7Y6To
         /FiA==
X-Forwarded-Encrypted: i=1; AFNElJ+ZsfIS72vbTSIkKFeZQYNb9MHfyPK2KQkbZnYFR7iaP/0nMJxKnFlkVBwulbiUppiNjlmqW2RNmQYeNL2F2fM=@lists.linux.dev
X-Gm-Message-State: AOJu0YwP4bPRtfQ6zqJbdCSv7oQ+Z+8KYSDIvVuuQIwN1HrVrDqHqmaf
	5hnTaRmpUACd750n0CLBdsdutiXe3564bZdfRr9mJ7cTBxHNz0CDu8hM
X-Gm-Gg: AfdE7cmXF3yR2Rhe4mV9sooAZ7gw/9UsBZr2PnKy4SQUW8sjdYZ0ya4D7pwC9cSmy7V
	3GlaecPxWT4u41DLO4eCpE/+UUaynUL5UtPzY2XJCVJzM5nxEHEWXO6sceP3u8izLDuCSh5ZzoP
	J4zrHG59grpaaqlpBZFheKE/zKJ+86kiDbfGCQaQjNFV/xOquMktUZGz0f0AqEGr1kP1hNDp4+o
	CUnzFTFjYYGe4ihPvEdH1tWfpYGFHYSgQPfEVPAtViyYh6bRlMoiP5QbJRBgcXA/3R2c1xS3JEK
	0sVbiRWIBoaxJS3ps+zoKLST7skNKxKIKVCau49KvognUC2Iyt9O6/TbJ50jW8JZoYwFBAiM6PH
	ePN7Lbd1uhsTyw/vGvEeMMsx/AEaIP/Wtsu8Of74ZB8zh7FATFYqgcIdVYp0mxNTnKRoiy8n/qC
	UXteUKe2Jsig==
X-Received: by 2002:a05:6a00:2c95:b0:842:5ea5:5fe0 with SMTP id d2e1a72fcca58-84591b260d6mr2136947b3a.6.1782194727240;
        Mon, 22 Jun 2026 23:05:27 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a57:2041::1002])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564ee3dc2sm9160454b3a.58.2026.06.22.23.05.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 23:05:26 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: sashiko-bot@kernel.org
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	jerrysteve1101@gmail.com,
	linux-amlogic@lists.infradead.org,
	neil.armstrong@linaro.org,
	robh@kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH v3 3/3] arm64: dts: amlogic: meson-axg: Disable pcie_phy node by default
Date: Tue, 23 Jun 2026 14:05:14 +0800
Message-ID: <20260623060521.599380-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260617083401.8777A1F000E9@smtp.kernel.org>
References: <20260617083401.8777A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] Enabling `pcie_phy` on `meson-axg-s400.dts` is insufficient to support PCIe functionality because its hardware dependency `mipi_pcie_analog_dphy` remains disabled.
> --
> 
> commit cd94d06969e9f9a23ea319f406b8e86e8ed9ec44
> Author: Jun Yan <jerrysteve1101@gmail.com>
> 
> arm64: dts: amlogic: meson-axg: Disable pcie_phy node by default
> 
> This patch disables the pcie_phy node by default in the meson-axg dtsi file
> to suppress deferred probe warnings on boards that do not use it. It then
> explicitly enables pcie_phy in the meson-axg-s400 board device tree to
> preserve its PCIe functionality.
> 
> > diff --git a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
> > index 285c6ac1dd613..7ba249cc3d569 100644
> > --- a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
> > +++ b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
> 
> [ ... ]
> 
> > @@ -448,6 +448,10 @@ &pcieB {
> >  	status = "okay";
> >  };
> >  
> > +&pcie_phy {
> > +	status = "okay";
> > +};
> 
> [Severity: High]
> This is a pre-existing issue, but is it sufficient to only enable pcie_phy
> to restore PCIe functionality on the s400 board?
> 
> The pcie_phy node depends on the mipi_pcie_analog_dphy analog PHY via its
> phys property. Looking at meson-axg.dtsi, mipi_pcie_analog_dphy is disabled
> by default:
> 
> arch/arm64/boot/dts/amlogic/meson-axg.dtsi:
>     mipi_pcie_analog_dphy: phy {
>         compatible = "amlogic,axg-mipi-pcie-analog-phy";
>         #phy-cells = <0>;
>         status = "disabled";
>     };
> 
> If the analog PHY is not also overridden to "okay" here in meson-axg-s400.dts,
> will the analog PHY driver fail to probe, causing devm_phy_get(dev, "analog")
> in the pcie_phy driver to continually return -EPROBE_DEFER?
> 

I'd like to add an additional patch to resolve this pre-existing issue reported by Sashiko.
Unfortunately I don't have S400 hardware available for testing.

> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260617082239.645562-1-jerrysteve1101@gmail.com?part=3
