Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794902318;
	b=kz24mCCESy7m75DIgKM4NgSWsuQaQzVS0q8WtAMHh2HlaeU8KhS2FjgknQ9DW7BX1gqx
	 D1JfSbgNO6FBG+sGzbuTCGVdsf74e9F6ZnGxmroy7gPxQ6+97gLcKAYzhkOii5V/crE3Q
	 OYljzrafe5wynF7Y/0HWfijOfBUzRNFMlE9kWT8Nw/hfho1j8xyBGTIGIm6l35BoCi+mL
	 qNjYHuIvMP+3EN8ktM/9mvOzuq/V/S91W6OPBlOgEvsCE+HCIJr7VWJ9spWAVJjjGiINi
	 Ld292KW/hvJMf1/oz5+IetVXVzBgQmhb/AFaflTksdrHG7SGIoDmppJyfDpNsY9+OBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794902318;
	h=DMARC-Filter:DKIM-Signature:To:From:In-Reply-To:User-Agent:Subject:
	 Date:Message-Id:X-Lms-Return-Path:Received:Cc:Mime-Version:
	 X-Original-From:Content-Transfer-Encoding:References:Content-Type;
	bh=I7ec6eY4A4tNdQoPCaM8/MCWa6EmraFZtN/PsBNrDHE=;
	b=xky5/rVCO/9258fhCv8eBKbR592e0wbKgMPvWjGgrk+VI+2z7D85G6h7byHgJJlPxzHt
	 9kR+RPo86/dZObHRWwj2FUoSFlChrnNrE+qTK2SpG5sldwpiqj+8gm9GkALVsRdWLt7Wt
	 DJ1y9kVuk+7tPKIa88R8+fGhHDPoHJJNLIj38B7qctVf+ez+aKAajTqellqYiMqsrWSzD
	 G2S6eoGJLsfmeketoujN1EvluS+hdp/07/1p+Whvzpd7ewM9kiWutUpAMlCgIVZ/PoA1I
	 klQMhC/uiLOAxwj9OEEgm+gTBGDjTH8QInZ9Y53M1D3xpNoN9WD8850UHG9uJ1juR9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.cipunited.com;
	spf=pass smtp.mailfrom=oss.cipunited.com;
	dkim=pass header.d=oss.cipunited.com header.i=@oss.cipunited.com header.a=rsa-sha256 header.s=feishu2303200042 header.b=U1G7Vw0A;
	arc=none smtp.remote-ip=209.127.231.46
Received: from va-2-46.ptr.blmpb.com (va-2-46.ptr.blmpb.com [209.127.231.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D93606A329
	for <sashiko-reviews@lists.linux.dev>; Tue, 17 Nov 2026 07:58:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03D93606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.cipunited.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.cipunited.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oss.cipunited.com header.i=@oss.cipunited.com header.a=rsa-sha256 header.s=feishu2303200042 header.b=U1G7Vw0A
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2303200042; d=oss.cipunited.com; t=1794902311;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=I7ec6eY4A4tNdQoPCaM8/MCWa6EmraFZtN/PsBNrDHE=;
 b=U1G7Vw0AFvtgCW407o7BbffGVvkibDb7886ZDQqr3QzSsQjbc5+ylMXyoyWk58828nEePr
 2T8iSP6adsiPhQq9R3grwNMNBPGNNn/hEpqK7/zvBxpyfcS1oCoj9/fNzDQgIJvNyz4dWk
 aqHJ+KdRKQlshah+VFFxwaUdn5cFsYVVGpqvGJLNAhyRJdyc59PrintiYykWhGyKShA0LA
 HxXg0YJ3skljisarBWViem8mI2tS2aPYZFnlz0eDFeCEk7Uir8yD2gK84CNtc7J+fXAU1z
 p2Ra2a+hhdja7tq7l95fkuHmgONgTU1y9s/d3KfnvB+QGFVy988Db/fCTTAu2A==
To: <sashiko-reviews@lists.linux.dev>
From: "Rong Zhang" <rongrong@oss.cipunited.com>
In-Reply-To: <sashiko-outbox-212658@kernel.org>
User-Agent: Evolution 3.62.1-3
Subject: Re: [PATCH v2 3/8] MIPS: Loongson64: dts: ls7a-pch: Add missing #address-cells to interrupt controllers
Date: Tue, 17 Nov 2026 15:53:25 +0800
Message-Id: <16dbfec04540d41d6aa9bedc4f31b8668394a455.camel@oss.cipunited.com>
X-Lms-Return-Path: <lba+26afc0925+809bd5+lists.linux.dev+rongrong@oss.cipunited.com>
Received: from [192.168.8.156] ([171.15.157.139]) by smtp.feishu.cn with ESMTPS; Tue, 17 Nov 2026 15:58:28 +0800
Cc: "Rong Zhang" <i@rong.moe>, <linux-watchdog@vger.kernel.org>, 
	<devicetree@vger.kernel.org>, <robh@kernel.org>, <conor+dt@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
X-Original-From: Rong Zhang <rongrong@oss.cipunited.com>
Content-Transfer-Encoding: 7bit
References: <20261113-mips-ls7a-wdt-v2-0-e8abd6b2f77c@oss.cipunited.com> <20261113-mips-ls7a-wdt-v2-3-e8abd6b2f77c@oss.cipunited.com> <sashiko-outbox-212658@kernel.org>
Content-Type: text/plain; charset=UTF-8

Hi All,

On Fri, 2026-11-13 at 11:01 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] MIPS: dts: loongson: invalid #address-cells on ls7a-lpc node
> --
> 
> commit b3cb4b22fb7d7fa764f95bec26fd2bfb7137915e
> Author: Rong Zhang <rongrong@oss.cipunited.com>
> 
> MIPS: Loongson64: dts: ls7a-pch: Add missing #address-cells to interrupt controllers
> 
> This commit adds #address-cells = <0> properties to the pic and lpc
> interrupt-controller nodes in ls7a-pch.dtsi.
> 
> > diff --git a/arch/mips/boot/dts/loongson/ls7a-pch.dtsi b/arch/mips/boot/dts/loongson/ls7a-pch.dtsi
> > index f304f99946f16..28038b8cdd146 100644
> > --- a/arch/mips/boot/dts/loongson/ls7a-pch.dtsi
> > +++ b/arch/mips/boot/dts/loongson/ls7a-pch.dtsi
> 
> [ ... ]
> 
> > @@ -26,6 +27,7 @@ lpc: interrupt-controller@10002000 {
> >  			interrupt-parent = <&pic>;
> >  			interrupts = <19 IRQ_TYPE_LEVEL_HIGH>;
> >  			#interrupt-cells = <2>;
> > +			#address-cells = <0>;
> >  		};
> >  
> >  		ls7a_uart0: serial@10080000 {
> 
> [Severity: Low]
> Does adding #address-cells to the lpc node break dtbs_check schema
> validation?
> 
> Documentation/devicetree/bindings/interrupt-controller/loongson,pch-lpc.yaml
> sets additionalProperties: false and does not define #address-cells.
> Unlike pic, lpc is not referenced by any interrupt-map property, so dtc's
> check_interrupt_map() does not warn about it.

Oops, I must have overlooked the warning in the warning sea...

Will resubmit soon.

Thanks,
Rong
