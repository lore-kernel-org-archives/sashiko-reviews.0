Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2403C226D18
	for <sashiko-reviews@lists.linux.dev>; Tue, 28 Jul 2026 14:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785248123; cv=pass; b=S+nao2WRvqpGbCjy/lZviO31PLLzogHea3fbHHV109pfo/qy3/kIXvHCV8Lwxt8LF9Ok7WxlSK/Gvs1jvsrnnMQHRnPfqQt1h5YW18PGMymx4tEHmn1j+P5J6zJrxU7hpMYzi6IpLEyJ+SvJ73rqa86qoGjladknwPt4mTBZsCw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785248123; c=relaxed/simple;
	bh=Y5IjH1Bdp/HIIEY319Pr351nUh4nrZWor13x1X2xdG8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hSo4slu4cO8v+NRofTRAUR7b9hSkmUPMUdDjb7mcJ15ohcBTEdDAPUI5B2TyotnR7E5fiIUdJTXrY8x84MsrBLa+pPcYiQaH6YARB41HwIqkShcsBT6Xa27t8WoAlWaeq36hnf0KdNZ8XwKcpyuUztX1SnE1eFYyRcVtns6UczI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n/FDpBzb; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n/FDpBzb"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-69c5fda04a8so6048029a12.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 28 Jul 2026 07:15:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785248120; cv=none;
        d=google.com; s=arc-20260327;
        b=bIW9jQxdaI0eqq1n5PLSmylq/DuGV7IhPI5gl31kDaKHZsbSjflOPyKfxnVPOvQ0Dl
         aQL1QG2/XJwKOnKhLkGW/9cM1b6tYkoQcSOVAGIuanpfyhrvHeeEIMJQfRhbQ77RxyMH
         ac2cEd2XF5NAEc1dLu9yeHjm3cXC04J4nri/Uj8yuZVDAe/jI2GAWdWh+bV3FtmlqtqB
         OybGaaMar+D0hfoeNn/iuiVYgEywtwJV6nwAHbxKiau5H6POZCJkNwvsPK5Qr/21Cf5u
         8dxsSlh3yTjZApwdTcjquTsS5RHCrdkQxIG80+FD0/dvek5C3fsXztJpyCXBcH9LUu9D
         e0Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jFo9QIGi1bowYtmXcjJ1ewwDQZf3d+IEplm5iC9s+fc=;
        fh=rEbUDeSlRDHDClN5FFB/8opoJgSDYGApSTj8TnPxcCE=;
        b=A5ny8i+lN0avjvzpNbQlK55/hV46psubi6kMuL2Oo7cnrVvUw2LkoKWZL/IOqrwkCf
         WDGeiX0MntooCalVRIF+kAvdLXwKRqiROi5yvmIjVLamSvDTxL12rkF/hh61tHFyvA1P
         5z67Ywl4i/YaHi5VpupecgTh8AXuhmNB/4Seq5w/MBrluDVSBeyukgkS+kTUDWg5x446
         qybORKQrJhmti3w6ht1udgmJxIDPTy+j9oxDtI8a7ZAP4E6oNG1c9b+52ElJXBEVOdti
         5vYIioU/uKldnhBCZMXtGn7NuI26zjyZkg+xIWWnwaqYds5oZnvh9L5KgCwrBaXoX3AR
         TQiQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785248120; x=1785852920; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jFo9QIGi1bowYtmXcjJ1ewwDQZf3d+IEplm5iC9s+fc=;
        b=n/FDpBzbhwp6bHaFQZJKL4CxnasiLU1h60nEx1KjUWybib6OijA139v5E+MG7F6cRd
         mb5KEYnQ9D/lK2Np8Tt8P49gT5KfT6r8TV/atAZ1J/4BvVJx7K2G0H/W+uEya6nYM4PJ
         84W2+JJkuOD/U/QdADuI3n44MTWsgF9YvnzMdbwMG/0tL/mevu5PYx9gyNu6x/GjJ0uX
         2ma7laCoPe/4imbTzqPOV64AbVdlh3bI8pXgSp8styOQSFALs0Vmu/3Us/T1PqdfmhpV
         Uc1FbTFUz0wz6xpTshZSAEXb1xq58ogtBd63bY2AvpbDiDRDRu1pumyZvGD25lLHEKo7
         xYzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785248120; x=1785852920;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jFo9QIGi1bowYtmXcjJ1ewwDQZf3d+IEplm5iC9s+fc=;
        b=kPOdvS9YAprDu7p2dZYkpHhcH1oItA88670BoKCNSBONF90MaW/gI/rSG1ku4QZ5ru
         Um6s0VPGkjf/SOmCJVVV57PV1jwMJEGfxixyIZcHJau4IVSviVnsq3UbZwlwYAFHVn4E
         z0vPGjqdppbklm25PwKzZNEU3XhwfGtimm1vzKIbTC4vEHAjNwXF7raVgvfu9uIKOmgv
         r88HkoniERHq7doy0KelgvV6t/TzFmz+75OJ6F1mI5gu7yE6yuNenSGKb5PpzwiG5Mcx
         EDIc7j+fzX1HOO4YIM+pbVWvbs+f23hrpDyVO29blRMOV6pwwK1kZBkJZDOGMmkhkIfn
         HWug==
X-Gm-Message-State: AOJu0YzGkhFZ6I7TdvzhMMCWLgEUjLWhjYvego9Q9/RagbaO3Ph+OLO3
	KSgVYjsaW+PHuUlzIiV5L9/mUAIGmMUGono+H07CugdLmOmsNchy8u//vFygwHxkBI91Y9d8pJZ
	5CfrBvHrITFeWo52FduMNfJq/a1Dxc+NmJSqj
X-Gm-Gg: AR+sD13JKoPgpIFLdn/RkrRUoKnzLSzX+BWgzmWsivk2Q+Kh+gGrDGmgazVjCEkI16r
	INdwLyK75MNk1kCjvY19HAtNzZDH6TSr2O/wWPN2E2+CF+xx4FU2LVwqJAgTxXWFd6romExuUPK
	oXXT0SveVupRmtfhTM0aKFqHfq6bHzIutjtLRsuIA0PAM0a9husixbVZfRwYrbDjb/N6/o+iUTy
	eyxjzWqfYAwDBSwF+DKz8S00vBfwDQKqd0/Z4o8brimtYnpf77vwSWAnd0RI9w=
X-Received: by 2002:a17:906:eece:b0:c16:12b6:243e with SMTP id
 a640c23a62f3a-c1f72142e48mr159558666b.44.1785248120024; Tue, 28 Jul 2026
 07:15:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260727075324.3555446-1-a.shimko.dev@gmail.com>
 <20260727075324.3555446-3-a.shimko.dev@gmail.com> <20260728075339.63B5C1F00A3A@smtp.kernel.org>
In-Reply-To: <20260728075339.63B5C1F00A3A@smtp.kernel.org>
From: Artem Shimko <a.shimko.dev@gmail.com>
Date: Tue, 28 Jul 2026 17:15:09 +0300
X-Gm-Features: AUfX_mwvkYMIMfnSM1177XFyXUjcy8-qLtZ8RZKWCrOcOA4UU_0PYQYh76WWUIg
Message-ID: <CAOPX744yuL15p60JKyy3eSoFWcy=t1tCtgKOdNN0AYb794Um6A@mail.gmail.com>
Subject: Re: [PATCH net-next v4 2/2] net: phy: add DAPU Telecom DAP8211R(I)
 Gigabit Ethernet PHY driver
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 28, 2026 at 10:53=E2=80=AFAM <sashiko-bot@kernel.org> wrote:

> > +config DAP8211R_PHY
> > +     tristate "DAPU Telecom DAP8211R(I) Gigabit Ethernet PHY"
> > +     depends on OF
> > +     help
> > +       Support for the DAPU Telecom DAP8211R(I) Gigabit Ethernet PHY.
> > +       This PHY is designed for enterprise and industrial networking
> > +       applications, supporting 10/100/1000 Mbps operation.
> > +       RGMII with: configurable TX/RX clock delays, optional flag to e=
nable
> > +       180-degree TX clock phase shift and internal packet generator.
>
> [Severity: Medium]
> Are the 180-degree TX clock phase shift and internal packet generator fea=
tures
> actually implemented in this driver?
>
> The help text advertises these features for users configuring the kernel,=
 but
> looking at the driver code, there doesn't seem to be any implementation f=
or
> them. Could this mislead users who expect these features to be available =
based
> on the documentation?
Yes, I'll fix it.

> > +     switch (phydev->interface) {
> > +     case PHY_INTERFACE_MODE_RGMII:
> > +             if (rx_internal_delay < 0)
> > +                     rx_internal_delay =3D 0;
> > +
> > +             if (tx_internal_delay < 0)
> > +                     tx_internal_delay =3D 0;
> > +             break;
> > +     case PHY_INTERFACE_MODE_RGMII_RXID:
> > +             if (rx_internal_delay < 0)
> > +                     rx_internal_delay =3D DAP8211R_DEFAULT_DEL_SEL;
> > +
> > +             tx_internal_delay =3D 0;
>
> [Severity: Medium]
> Is it intentional to silently drop an explicitly provided tx-internal-del=
ay-ps
> property when using PHY_INTERFACE_MODE_RGMII_RXID?
>
> For PHY_INTERFACE_MODE_RGMII, explicit delay properties are kept and appl=
ied.
> However, in dap8211r_config_init(), tx_internal_delay is hardcoded to 0 f=
or
> the rgmii-rxid mode.
>
> This might lead to unexpected configuration drops if a device tree specif=
ies
> phy-mode =3D "rgmii-rxid" along with a tx-internal-delay-ps property, as =
the
> requested delay will be ignored without warning.

Yes, this is intentional.

The RGMII interface modes are defined as:
RGMII_RXID: MAC provides TX delay, PHY provides RX delay
RGMII_TXID: MAC provides RX delay, PHY provides TX delay
RGMII_ID: Both delays are handled by the PHY

For RGMII_RXID, the TX delay is not expected to be provided via dts,
so any TX delay value specified in DT for the PHY would be incorrect and
is therefore ignored. The same applies to RGMII_TXID for RX delays.

I did this to keep the switch statement simpler. I thought it would be bett=
er
than adding these features to its cases.
--
Best regards,
Artem
