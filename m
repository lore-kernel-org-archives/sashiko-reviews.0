Received: from mail-ej2-f11.google.com (mail-ej2-f11.google.com [74.125.228.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBBA5493D56
	for <sashiko-reviews@lists.linux.dev>; Mon, 21 Sep 2026 17:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.139
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790011983; cv=pass; b=cvtydNmPbu3/E78cO9xWYz6eyL0iJFc9KBuwMmuf5lHESNIR/O8+IoYnebdlxJfgVE+no9AYY8T3t/FKwLU0bqWnD5wZ6DzoKxqPTLrkN33hQlC05OGPv56u1Dda/xiARTYIxrQlUhsEQliyanY8vnHqrSLoq51Fyw9Oxi7X7qg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790011983; c=relaxed/simple;
	bh=K9si7rBSGFSkQMJDZblogrtMa3XzYm8ZMWN3VzWupEY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jVDyeFkMRDyqcwmY9LiFswYbs6BHJwYpp0QcyX/2fJ/ypZ9LR5AmXlHZaxsfCP4p3nnp73Vbf16JuAi7RCSUA0SI4OT2IlHqnzFVf0x0zDJZim/T44puJzb65RWG3WZv2ABmsdnQeoGij+4WeUDJOb8VZH3JJMaDLgNwTz5oqN0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kbvfk1Jo; arc=pass smtp.client-ip=74.125.228.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kbvfk1Jo"
Received: by mail-ej2-f11.google.com with SMTP id a640c23a62f3a-c25541acec6so207475166b.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 21 Sep 2026 10:33:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790011980; cv=none;
        d=google.com; s=arc-20260327;
        b=aIfhx7PrThQO55x9DqJNGbxjk5DEqnhTP2H/Tv7o4whTrJmhNlUD+WHd3VI4kQ76BK
         RHnHyySw/F77SKr0XCY3tGodsHlpC3FmwWa8PNq6mwBLFU6ZHB1d0FDOTu1aYBKFjcdI
         IxlRLAOY4trikMU332GLNqFlnAh7D/6xUa+Dw0Z8THu1NukbT+CTpdl4vb7TuCar2xGw
         cnQfBANn04Ech9WJvSeId7b9NDN1NgIZ6Nc7Q2KysHsI8X5Yy8ACbp1nlg4WfQGe+HY5
         9IFNCJLJSvq0DyYUwWgC+nmcHtunQ1jFqRGNa2YfvOA/NOXT6qKm86auZHuDm9DF7bNP
         jOBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VuKnziCRcnwT2EUABNsJz91YeadinAdPu4p/tIggi6A=;
        fh=4yl34sdi/40HqkSljb4sqqZFMapDtRgv7q6zupv0K8Q=;
        b=MSS4MDeFwX/qdpqa3cCw3vXZMICQgkhTmvHbFiaDtIp/WQDZOzrl8c2iN2OZJ/rHrU
         gQ9qGXaTN96pocEbmMX6ZCqIt/pOyek9GGIr0/CT55qsxPfrdkhvR/wR/SK9XYTKYour
         5H0F27xWStBsnFbo91V1K6/0tM2jpx2hKTNnvrXPulMjE/RYL/gBH7IOpxDvw6nSb/JA
         AXvXsumMCsfU3Sh/rckE3KsJqmpcHvgk7N7t4oZ1zCCgr480kN0tLAEw5mRWvG5nGrrY
         k2WjznrL0OSog25ixyRTV8kGz1xmJaNt1/2Q5O61awAlNZb0jCuCJ7ZqEYTPZDkyrMhs
         xIcA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790011980; x=1790616780; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VuKnziCRcnwT2EUABNsJz91YeadinAdPu4p/tIggi6A=;
        b=Kbvfk1JooYZgwgpzQxgZKMnFR+82Cv8bkxP54pwm2+t06MnZ0K03F/LW4Va0YcS9cn
         ugIAVDSMBlNAPO4O4hZ2+wll5Bfx38jDOoUoxB+VTkwSXXdNnPVbMYehwumZwJLm1V4X
         apN5w6WML9br/fQTVIcBNK5cQpX1n2+oO9eFMovYOoSD5pKO2lAUfT77RFXeGD8ul7RN
         Q+fLASfgu2AD+gvT6tDkFtR+8Dr1FMP6fR/zbA0uTOraAFzIZYVGxi6tEPDcxZEY2TKz
         4mXjK56lssom93XqDRNO5UTUbleidEvCRofAYDBHiw8GhktLFgU3fqNmpU6+lOn3NUqX
         EGHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790011980; x=1790616780;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VuKnziCRcnwT2EUABNsJz91YeadinAdPu4p/tIggi6A=;
        b=Z5SClO6jVgx7HHynDCiiID8zKJ5bmEslGvvvARbPHNz5jcbrIp9Qy9fQ7fuQfqhFK9
         5PaTEVXUs0sMZm166IqPGeyUcEaVcfcop1Fb4ys+rCj5ISXV0oAkAg3A+fUsBDTAxRu7
         IM91+VBIgFY64rbw7yt8Pc3MWJ9UwnYyT+kxyaemFaFy4IVCTp63BI1qR54qVLpYBKZv
         OGXvjr9HGhfsqaFhAZtaOsQiWNrdfSmnKS8c4ClllREnoQ//fBlDfuF36m2U6zBmACVx
         9NeNPFFhUP0utcEkKeUBi89XVTzey0YtkHcL7jLotBlyb6+sTPiD2B7gZpcLZJIJ4IcG
         Jxaw==
X-Gm-Message-State: AFuF++mMvIrMv/b41QPWRxdQSTyCzY5+0K+jzq3U2k9VG9++vYSQPqd/
	/OpiTXC8qw6ZARZ0QC3eRouuwR1H0VjucI3ZLtD+arsXoXtqxwOBabS8ybUFz9uCMLe/eLwzX2M
	dGzEYaCiQCcwfPeRHOYit5YN1YOqvZtzEvQ+SeiaUTw==
X-Gm-Gg: AYBFou0YhoaqgwwJ64E03F0qfoEmAxDMdT1zo9oAQGA81T5vdk/KtCKrOCf+76Y9uZ5
	ZQGCGp/ssqEciUUTT4k8buXEaPosfH5N5pqClmQEmZyxd0QyuqyXjk1uVi6XlOJq93VZ8/vujR3
	XMEAOaGKrOvIxvlREBYHNqt/SliWnBJu7NzEJj1qRCf5fIr7u3Zx9p9F6VZ+D9CrFN/orS0oK8+
	CQ5SZM3ANbi6cl8rD1FUcJq+mItZ95MgI9lRgEa1CTNmVcuSZbER/CX7FucEbVniKz11WcWzWQU
	57WF6XSW3IAazEEkhuzUuI87XwACVcg8LQ90+eMFMUVMlRpGSjdV6sRSkQ==
X-Received: by 2002:a17:907:d18:b0:c27:420b:7c82 with SMTP id
 a640c23a62f3a-c2a15e0e909mr1026408166b.48.1790011979683; Mon, 21 Sep 2026
 10:32:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260920170116.3624104-1-coiaprant@gmail.com> <20260920170116.3624104-6-coiaprant@gmail.com>
 <20260921170343.4CA421F000FF@smtp.kernel.org>
In-Reply-To: <20260921170343.4CA421F000FF@smtp.kernel.org>
From: Coia Prant <coiaprant@gmail.com>
Date: Tue, 22 Sep 2026 01:32:48 +0800
X-Gm-Features: AcwNN1UD6p5KTncPSk1LxfRScJC4KOn99w2_Eqc8eBCD3CAs0EpL3r44H49taEU
Message-ID: <CALj3r0iMGUoM_VmS70NnnA99-G7_TjgA3s_x8ZmvNe12QxWoxw@mail.gmail.com>
Subject: Re: [PATCH net-next v9 05/11] arm64: dts: rockchip: rk3568: add XPCS
 and fixed-clock nodes
To: sashiko-reviews@lists.linux.dev
Cc: wsa+renesas@sang-engineering.com, vkoul@kernel.org, olteanv@gmail.com, 
	linux-phy@lists.infradead.org, robh@kernel.org, conor+dt@kernel.org, 
	neil.armstrong@linaro.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<sashiko-bot@kernel.org> =E4=BA=8E2026=E5=B9=B49=E6=9C=8822=E6=97=A5=E5=91=
=A8=E4=BA=8C 01:03=E5=86=99=E9=81=93=EF=BC=9A
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] DT style violation: non-reg nodes placed out of order
> --
>
> commit 1674fcfaeba70039871d92af0a02901f9d009886
> Author: Coia Prant <coiaprant@gmail.com>
>
> arm64: dts: rockchip: rk3568: add XPCS and fixed-clock nodes
>
> This commit adds the Synopsys DesignWare XPCS and two fixed-clock nodes f=
or
> GMAC reference clocks to the RK3568 device tree. It places the nodes and =
adds
> necessary properties for board-level configuration.
>
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3568.dtsi b/arch/arm64/boot=
/dts/rockchip/rk3568.dtsi
> > index 3bc653f027f1f..227d03e336043 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3568.dtsi
> > +++ b/arch/arm64/boot/dts/rockchip/rk3568.dtsi
> [ ... ]
> > @@ -110,6 +110,51 @@ sata0: sata@fc000000 {
> >               status =3D "disabled";
> >       };
> >
> > +     xpcs: ethernet-pcs@fda00000 {
> [ ... ]
> > +             xpcs_mii3: ethernet-pcs-mii@3 {
> > +                     reg =3D <3>;
> > +                     status =3D "disabled";
> > +             };
> > +     };
> > +
> > +     clk_gmac0_xpcs_mii: clock-xpcs-gmac0 {
> > +             compatible =3D "fixed-clock";
> > +             clock-frequency =3D <125000000>;
> > +             clock-output-names =3D "clk_gmac0_xpcs_mii";
> > +             #clock-cells =3D <0>;
> > +     };
> > +
> > +     clk_gmac1_xpcs_mii: clock-xpcs-gmac1 {
> > +             compatible =3D "fixed-clock";
> > +             clock-frequency =3D <125000000>;
> > +             clock-output-names =3D "clk_gmac1_xpcs_mii";
> > +             #clock-cells =3D <0>;
> > +     };
>
> [Severity: Low]
> According to standard Device Tree coding style guidelines
> (Documentation/devicetree/bindings/dts-coding-style.rst), should nodes
> without a 'reg' property be placed at the top of the file (or the top of
> the root node) and sorted alphabetically, before any nodes with a 'reg'
> property?
>
> These clock-xpcs-gmac0 and clock-xpcs-gmac1 nodes in
> arch/arm64/boot/dts/rockchip/rk3568.dtsi lack a 'reg' property but are
> placed directly after ethernet-pcs@fda00000 and before syscon@fdc70000.
>
> Could these be moved to the top of the root node alongside other non-reg
> nodes like opp-table?
>
> > +
> >       pipe_phy_grf0: syscon@fdc70000 {
> >               compatible =3D "rockchip,rk3568-pipe-phy-grf", "syscon";
> >               reg =3D <0x0 0xfdc70000 0x0 0x1000>;
>

Thanks for the review. This is a valid DT coding style issue.

I'll move the two fixed-clock nodes (clk_gmac0_xpcs_mii and
clk_gmac1_xpcs_mii) to the top of the root node, alongside the other
non-reg nodes, and sort them alphabetically in v10. No functional
change.

Since this is a low-severity style issue and no other comments have
been raised so far, I'll wait 24 hours for any further feedback before
sending v10. If there are no additional comments, I'll send v10 after
that.

Thanks,
Coia Prant
