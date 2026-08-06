Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CBF8352C52
	for <sashiko-reviews@lists.linux.dev>; Thu,  6 Aug 2026 07:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786003163; cv=pass; b=rYh02CFS6lGYrRP0NG1Ngryea5lQJKei+Lj9lYtM5oIrtUW/1cORlKPTZX4vARki6OwdLgjmAfpbGTbBUr7jYvcvEJj3TuK5QkI61VTGlxBSPO+9o+ZZxeVplp/9/H0QBb0AcAgnK38OT93ukglIZQM1NvC5LOC9hSRbwFOE0Ow=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786003163; c=relaxed/simple;
	bh=CZqe83CdbrlQPi6FPgQSJvI2rkWIn+KuZ+8/6Lb2N88=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P/5hcUtFGd0f4VEa50Xso3PmhB84CbEvcyUZLuM2UfkVruUpi0CdSB8jKXzdCOCjfq3iC3Ta4kiVyikL7iz9RPdGK6+Zaf2B0EZYVXvGT917Gbs4TqjJO0nql+s1KDixAA0FKMIQ6Mt7lAvZPAotXjCKk7ZyhFl18GgK8SGpMhk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QpjPqyTA; arc=pass smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QpjPqyTA"
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5c3163a88a1so500733e0c.3
        for <sashiko-reviews@lists.linux.dev>; Thu, 06 Aug 2026 00:59:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786003161; cv=none;
        d=google.com; s=arc-20260327;
        b=b6TwvvBbWJ3usBSjmfBuyUz7cqAsWryPLd8ZAez0zMjH7m8ycMFVc9Ca7Z7IVXeJig
         CCmhGvqTYOuGkW8o7AOLG8KuHQHPPxls36JEkiBwvU7LMDPovSsLRndOAFUfZJY4aMba
         lIyabjg5n37u1Im2NwdE4tbdlNd/jGKLlvyy1KxzvsxKa1QQUEHSmQrHeDRbUpZZT3ZE
         cBM/Jx5Dc/nBy3Rv6sz2ctV30vkrHmoHszHs7Wmlv/WDOnz1RcnHlamyGMwSDU55WwCe
         d9vlcOhUYZ7xy+f6OqxIcioeHMZNSu1LdLF+GBw496spUPGOU7kROPfcJ6olOTEnr47h
         BFBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=59YY+DXL2yyj7pyfiGeJfPdqCY+fQlQZUi24hVUCSOk=;
        fh=53qvJawqK0TJTsq+MaD47KBMEtgXQmC582XHmZ7TrbI=;
        b=Xv2ciSHKe/MD9metqgW5cAQNn73+GeWht/pBayAoXW/RT3cHUJrOUuhX1JGJcSquV4
         Qm4qCdyIixDMP4225B/GGHREaklEBnat2GbfyEWr+f2ajQd44hB4UyrZmPszt/8RNFMB
         MC4ilGWsNmtxpi1vbCwnLtd6l4eS0pyCOB8arWqC+2JKWlk7CmHU6NvNjS6zJnQAGBw5
         649sOQY3c6D+pl0DP0mfBH3TSaeyEprGRGM6b6NcIe5FNCnRYQKOHYaUEuINlD7ePZ8j
         n7F9AV2RTJNMKZVyZKTspHbjNopGlfjDiinkWTWLPdAFtetNREkQbFKY30sGNLSYfAOH
         Nl+A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786003161; x=1786607961; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=59YY+DXL2yyj7pyfiGeJfPdqCY+fQlQZUi24hVUCSOk=;
        b=QpjPqyTA4eLI5xqmVEngADEbuWu4UXVjOxor+bgnSaov3S0cmxvdad9Pq3m9WTtPYz
         WkSPgT6BFpTMCL/hUWB24zJPtbKuqzrScQV+0JXDkamVo3rvZkim9FwvAEK0zhW/mym1
         RuaSDFy4NK1L+4txOnbxUC+VU6TWHRxniYaLjWJnessRxkPXqB7CKbnVYoz9Bnq1ZNn3
         F9x3JjrP9P6vxlCw5OPlNkfnUVA/K2tpaEE7nuDdwAVKBRFrw/cBESLSXmLcWKJxMiHL
         PHuRdX7VfmibSIPg8WKN8+O1XzFZ/DDiT+zsYu8ex7vb1mZVNefY7vrCT/retC16keyU
         BMow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786003161; x=1786607961;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=59YY+DXL2yyj7pyfiGeJfPdqCY+fQlQZUi24hVUCSOk=;
        b=HTFbz9aTL5+QdY6ZfpUf8jP2cHe4l6daxizPSayLaI+reS6NQhJClQ3cZ3/sGh5uKB
         swWuwZQ/PxWP4ZUEc+WPLjG5pfSC799wI50TuG2TxvrBeIwzS7Ui7P3Q4ycIXjTlBQfx
         IMhVXHbOdjHr4zGWQxL+eqruie89m04SYg2OO49PFqcs9Zszp6xdZjUTEf7lMHb1KilC
         KaywJt3gyBVvWjEEvefG0+eB1wFzcp1p+C1BuBbz6P2qJpaWTB6VcpdNADni9ewuL9uN
         E6sCDHkhsoA3EIMSOvPkEj665hFI9iXNXMLrwvfe+MC7wt5YArUBCA/WmmXMlxXAVy+l
         jLGA==
X-Gm-Message-State: AOJu0YyNGR8OvwS08KPH+r+WhvBmzPnAIWOE0VnAKItLE9bl8zHk0Di+
	lBtoZeeURob/V8wk2LMhLqPvfNhhBTd3K0FOGUSDRgr7F1+qejD8uUzM6HhK6J8z7O9eGwzrLos
	zqGRCAKzAuBThSnEBBN/0e11GX5JktLJ84A==
X-Gm-Gg: AR+sD13b3dKUrcPNXlN0YGsiHJ/B4EV+BAPPLzuvv4wgFB7WyHeSVXaC2hRD5Hrp2zK
	JAoAGKlXa+EVw6WmfwMNYOIb5XyaQU2B1mGVWsHn06lLqlClX7452hqICOcSyXbKjWk4d+qKUVx
	dACwS14/Gni5ja95Aa3y5DYbIUoJW2H144bWkotLg8x0dBLBFGSPiK8awlBheUXWLdYbEJ7En/I
	M1etxSHLfSERVfqhGARYBDJV3OY49V72vSLxs/+QBFz3R0A2vKR0PReSk1rlQnAT5UEU14wUlh7
	efxYSoGRbuJeg17zjcZ+18kizE1fA0wPHmLkFfEiKEvoaDYOStNzdzW/Og==
X-Received: by 2002:a05:6102:4b08:b0:739:4fa1:50af with SMTP id
 ada2fe7eead31-760e6aca466mr3111728137.2.1786003160956; Thu, 06 Aug 2026
 00:59:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260805-anacapa-devlop-phase-devicetree-v4-0-5d67e0efa6c5@gmail.com>
 <20260805-anacapa-devlop-phase-devicetree-v4-10-5d67e0efa6c5@gmail.com> <20260805132859.6F6DA1F000E9@smtp.kernel.org>
In-Reply-To: <20260805132859.6F6DA1F000E9@smtp.kernel.org>
From: Colin Huang <u8813345@gmail.com>
Date: Thu, 6 Aug 2026 15:59:10 +0800
X-Gm-Features: AUfX_mzuaNQ0eCcXnJkxAnzIOeQjXhrujNKvSlE_ciN8OvZiMygiEuyy-Lxy2UE
Message-ID: <CAPBH0A_AtoLWYQ2TCXc_AhcgTreOppK8=to+hn-SX7kkwtPs4g@mail.gmail.com>
Subject: Re: [PATCH v4 10/12] ARM: dts: aspeed: anacapa: Add LPDB fuse monitor
 GPIO expander
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<sashiko-bot@kernel.org> =E6=96=BC 2026=E5=B9=B48=E6=9C=885=E6=97=A5=E9=80=
=B1=E4=B8=89 =E4=B8=8B=E5=8D=889:29=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] Meaningful code and commit message mismatch: The patch modifie=
s userspace-visible `gpio-line-names` for existing `gpio@22` and `gpio@24` =
expanders on both LPDB and RPDB without documenting these changes.
> --
>
> --- Patch [10]: [PATCH v4 10/12] ARM: dts: aspeed: anacapa: Add LPDB fuse=
 monitor GPIO expander ---
> commit dcdaa17a966db9099c36ac9d58c5a7e8e75f9c5d
> Author: Rex Fu <rex.fu.amd@gmail.com>
>
> ARM: dts: aspeed: anacapa: Add LPDB fuse monitor GPIO expander
>
> This patch adds the PCA9554 GPIO expander for PDB fuse monitor signals on=
 the
> Anacapa BMC board. It adds definitions under the i2c8 multiplexer for bot=
h
> left and right PDBs.
>
> > ARM: dts: aspeed: anacapa: Add LPDB fuse monitor GPIO expander
> >
> > Add the PCA9554 GPIO expander for PDB fuse monitor signals.
>
> [Severity: Medium]
> This isn't a bug in the code, but does the commit message fully describe =
the
> changes in this patch?
>
> The commit message solely claims to "Add LPDB fuse monitor GPIO expander"=
, but
> this patch also adds the RPDB expander and modifies userspace-visible
> gpio-line-names for existing gpio@22 and gpio@24 expanders on both LPDB a=
nd
> RPDB.
>
> For example, it renames "RPDB_I2C_TEMP75_U8_ALERT_R_N" to
> "RPDB_I2C_TMP432_U8_ALERT_R_N", and adds new labels like "RPDB_SKU_ID0" a=
nd
> "LPDB_VERID_A0".
>
> Could the commit message be updated to reflect these functional hardware =
label
> changes and the addition of the RPDB expander?
If I need to send v5 I will update the commit message.

>
> > diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-dvt.d=
ts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-dvt.dts
> > index 0eb547ad0ec16..f09dd1abe77d8 100644
> > --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-dvt.dts
> > +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-dvt.dts
> > @@ -8,6 +8,93 @@ / {
> >       compatible =3D "facebook,anacapa-bmc-dvt", "aspeed,ast2600";
> >  };
> >
> > +// MB - PDB
> > +&i2c8 {
> > +     i2c-mux@72 {
> > +             i2c8mux0ch0: i2c@0 {
> > +                     gpio@22 {
> > +                             gpio-line-names =3D
> > +                                     "RPDB_FAN_FULL_SPEED_R_N", "RPDB_=
I2C_TMP432_U8_ALERT_R_N",
>
> [Severity: Medium]
> This is where the undocumented RPDB expander definitions and gpio-line-na=
mes
> modifications are introduced in i2c8mux0ch0. Should these be split into a
> separate patch or documented in the commit message?
>
> [ ... ]
>
> > +             i2c8mux0ch1: i2c@1 {
> > +                     gpio@22 {
> > +                             gpio-line-names =3D
> > +                                     "LPDB_FAN_FULL_SPEED_R_N", "LPDB_=
I2C_TEMP75_U8_ALERT_R_N",
>
> [Severity: Medium]
> Similarly here for i2c8mux0ch1 in the Left PDB, the patch introduces
> undocumented label additions and modifications to the existing gpio@22 an=
d
> gpio@24 expanders. Should these changes also be mentioned in the commit
> message?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805-anacapa-=
devlop-phase-devicetree-v4-0-5d67e0efa6c5@gmail.com?part=3D10
