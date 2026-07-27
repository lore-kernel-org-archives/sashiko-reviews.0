Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A1C23E5EFE
	for <sashiko-reviews@lists.linux.dev>; Mon, 27 Jul 2026 08:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785141926; cv=none; b=bRIstksLz/4oBzxxCXTWiy1nKKleEOo1ol0eCRDYqN2jEQos0tJ1liT9J/WNuLhGWkfnEH94hBn+XmjlG+NdB7OPqgC5UqWCpg/FUHqA4cedltG7wn/ciV3OnceNlJINlvO8GAJ0mAnwB6jPedPL9qPdqMRWN+c7npm5umDrGUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785141926; c=relaxed/simple;
	bh=tfiikxbpEsntnXsRIbfP6OcnD1+V3RgumXOEyNV27kQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fsvQ/F5s7xuqpZYtU1xcpZsbnn8w8qEw6a08Tpvk7jMcdPD4f6xbtalod2MkRKjJe1CKkZqciOJw6GLasUouxQboNFtZZfqfhhgxv9L7TLYgddTRkR/sfgT35Bj9RbREhV4dCSOkoq+SRTGuz9YKbpEqOtEOprbDaOqElqTkUX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fGi/zEwL; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fGi/zEwL"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-476a130c138so2394760f8f.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 27 Jul 2026 01:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785141923; x=1785746723; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=879jIPCYb5W8l5rBfBUn/ihr+BRPaeGUdfS2I+YUk4A=;
        b=fGi/zEwLhCEj1RLUBVeVpHHeTKOx3Mcc8KjQ80D+lkUr/uZ3pG6VxCgWqh/5/q8R/L
         213W2/e0Um+1NS7j1QCwTarYvqNq19O3se88zSV+bb/21Q2dJ2KylGfFl6F56VXGSddp
         mkYMd98Kr9sRaHumJ04lC4JFTxOwWTukDWneuOx1nCh+ZBMd0vOZ8Yikf/O9SYBZtCX4
         +HD2V1iwq0USROMq6kXpSVSJJmwU2RCwXOZuo2twRrJLg/TKkSLvKM4u8+KdF50pycsR
         1EnaB2AyU3Xn3EBBPZDwIvLQ2NMnPHOWnn/K7BfycuUFT6tNGlgNSohDqOfkmVeNxb+7
         ooig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785141923; x=1785746723;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=879jIPCYb5W8l5rBfBUn/ihr+BRPaeGUdfS2I+YUk4A=;
        b=B07dirPEMQy42K1XHJL/zCQbya8vHHkOEArukpCnf0dZ3kzVq7/uCBtFDfq4uYl5C/
         aDZ79vSXvTsCI3MZG2baJ5trRCkrlpGKBGMH5arp7aOxPsoNKvyMOIxmKyqACll88DT8
         mzFbVqbxv+Wr4KvfpNXlYgaa4Xur/DO63kFzrFGRg1z3IctuH0Og73AQ2qMj678ekbOY
         0n6vhS6gfHjxOVwntFdCx2JHXVCJSrPwymTDqXOU0knks1d03IBPOSy0mYQdhTuy4IsY
         iNcXYePwS9sQTr8JPoVoN8eqOA4z2sAWmbf+lXU+T7SKJDw8TrFz1nxf6mb/zpOOGj5z
         po0g==
X-Gm-Message-State: AOJu0YxQajK0RgXvaTEVipu3qVy4E6BXJiE8pz/aALojtgZKHD5+v+uD
	J083vem86vPXPt6U4I6rdL3RtNOQBk1cUZNLnnvrQknDy+9Q+htYqVZIfCEB+w==
X-Gm-Gg: AR+sD13bvyz2uFA+/PE6C705aL202XP9Mo+1Z1ZmByb1T6p/Q8fkiKi8YsEqZjaP1qr
	q5pmwC+hghTdxMHdBYj/svDgfXMSWwGQEFq1GpXkr+wExY5opvpyVUaoTN2Fc6MrjgtHMIjXi0N
	f0PhefLwhOi05SdzIwmDhGo6WQdu3uJzcHdnrbb/OVtLmsO1ET4L9/Uq8Bl1+WEFG7btp8Fzk8W
	RU7Z/lOVyjdX6rX1203GqDul/MuJ4jV5bYkHrwa/pEC022AkBBigLBY5/JgvOPNiM0Q7Sf1PHHH
	Q/KA/tEfnS12URgT2f16caZdrbrLY8WkZScTGWZfRghaieFeZvi7mU/edJdjjcac2KF8bppNvHI
	mdZLvoePMjZhpoRue5u2H3wcd9ctHTIc/cXVMgJ87oj/9tx0nyP2ntiIeinwt0tKp5MyBKS2aFI
	lGm2hDRR6yP6xOYjYGH6W3nHeHOpC3pgt1NzjT+KgHHiYFrEovbtAj8+3fGalJ0Ztx5FjVgo0Ss
	UGbzw==
X-Received: by 2002:a05:6000:98d:b0:47f:837a:aa1b with SMTP id ffacd0b85a97d-47f9fe9300dmr9065641f8f.36.1785141922991;
        Mon, 27 Jul 2026 01:45:22 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c63678sm44117738f8f.29.2026.07.27.01.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 01:45:22 -0700 (PDT)
Date: Mon, 27 Jul 2026 10:45:21 +0200
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, Frank.Li@kernel.org, robh@kernel.org, 
	imx@lists.linux.dev, conor+dt@kernel.org
Subject: Re: [PATCH v2 6/7] arm64: dts: freescale: imx8mm-verdin: Add
 Cortex-M4F remoteproc
Message-ID: <fyoefmlhxpaqh3k5nv4zvna5usjvmdrd7e3hhtygvbkvmegxds@kgmwwh7ifcoc>
References: <20260724-v1-verdin-imx8mm-dtbos-v2-0-9d7988bd76f6@toradex.com>
 <20260724-v1-verdin-imx8mm-dtbos-v2-6-9d7988bd76f6@toradex.com>
 <20260724164132.7527D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260724164132.7527D1F000E9@smtp.kernel.org>

On Fri, Jul 24, 2026 at 04:41:32PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Unconditional enablement of the Cortex-M4 co-processor and its memory reservations in a base SoM device tree file.
> --
> 
> --- Patch [6]: [PATCH v2 6/7] arm64: dts: freescale: imx8mm-verdin: Add Cortex-M4F remoteproc ---
> commit 5627e466b821e2ae1d5d44438ab0c467605d30f9
> Author: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> 
> arm64: dts: freescale: imx8mm-verdin: Add Cortex-M4F remoteproc
> 
> This patch describes the Cortex-M4F remote processor available on the
> Verdin iMX8M Mini SoM.
> 
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
> > index 5fc177f589cb2..ac450fc6cbfb3 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
> > @@ -52,6 +52,18 @@ hdmi_connector: hdmi-connector {
> >  		status = "disabled";
> >  	};
> >  
> > +	imx8mm-cm4 {
> > +		compatible = "fsl,imx8mm-cm4";
> > +		clocks = <&clk IMX8MM_CLK_M4_DIV>;
> 
> [Severity: Medium]
> Should this node default to disabled?
> 
> Because it is added unconditionally to the base SoM dtsi, it defaults
> to "okay". This causes the imx_rproc driver to bind and call
> devm_clk_get_enabled() during probe, which keeps the IMX8MM_CLK_M4_DIV
> clock permanently running even if the M4 firmware is never booted.
> 

This is true and intentional from our side. The SoM DTSI now describes
the hardware including the M4 for the common use cases, instead of
requiring users to enable it specifically in an overlay. The drawback
mentioned here is a small tradeoff we considered.

> > +		mbox-names = "tx", "rx", "rxdb";
> > +		mboxes = <&mu 0 1
> > +			  &mu 1 1
> > +			  &mu 3 1>;
> > +		memory-region = <&vdev0buffer>, <&vdev0vring0>, <&vdev0vring1>,
> > +				<&rsc_table>;
> > +		syscon = <&src>;
> > +	};
> > +
> 
> [ ... ]
> 
> > @@ -164,6 +176,27 @@ reserved-memory {
> >  
> >  		/* Use the kernel configuration settings instead */
> >  		/delete-node/ linux,cma;
> > +
> > +		vdev0vring0: vdev0vring0@55000000 {
> > +			reg = <0 0x55000000 0 0x8000>;
> > +			no-map;
> > +		};
> > +
> > +		vdev0vring1: vdev0vring1@55008000 {
> > +			reg = <0 0x55008000 0 0x8000>;
> > +			no-map;
> > +		};
> > +
> > +		rsc_table: rsc-table@550ff000 {
> > +			reg = <0 0x550ff000 0 0x1000>;
> > +			no-map;
> > +		};
> > +
> > +		vdev0buffer: vdev0buffer@55400000 {
> > +			compatible = "shared-dma-pool";
> > +			reg = <0 0x55400000 0 0x100000>;
> > +			no-map;
> > +		};
> 
> [Severity: Medium]
> Are we sure we want to unconditionally reserve these memory regions for
> all boards using this base SoM?
> 
> Because of the no-map properties, this removes roughly 1.1MB of RAM
> from the kernel's linear mapping permanently across all Verdin i.MX8MM
> boards, even when the M4 coprocessor is not used.
> 

Yes. We lose only a small amount of RAM, in a region that is fine for
all our Verdin iMX8MM SoMs. The DTSI is now set up to use the M4
copressor by default, in line with our other SoMs.

> >  	};
> >  };
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260724-v1-verdin-imx8mm-dtbos-v2-0-9d7988bd76f6@toradex.com?part=6
