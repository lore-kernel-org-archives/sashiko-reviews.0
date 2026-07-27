Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 217E9418A5A
	for <sashiko-reviews@lists.linux.dev>; Mon, 27 Jul 2026 14:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785163414; cv=pass; b=ZDCmCVuR0k66u4vLxN5aqTY2b7kl8G/OApsyjMFDNoi3kTs38RluM/s3yk6OYIlX88P+ka8FkDDg1nENmPTNgSZcpXudnwhvKFTg0geK8+Itahyj9NVdom1YcYrodaeGS1rLVlzsS9GKHT40uvPiqP2vOWUfhRTO8AS+rGw72lQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785163414; c=relaxed/simple;
	bh=ilVF5rfbNsMKsrWNYd1qKt+Z0Gad44vws8Zb1fqpjSE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TDKv85G3HXfldcJ9o4feMcOSNuwbfI4mko39nvFapqlER6OS9sf74FR34KwZ5nN9kY7u1Dnh8Zt5xQi4zyB4/eB1aFCwwMrku2TuVjM9GZ7SVuRikKSNYIJLp+9ihhm8Vui3C+9TcdbpZ2FvdOyIlsobu7CssmEgLpyLrWrh6lQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OjRgYDkT; arc=pass smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OjRgYDkT"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-66899fe9077so4234126d50.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 27 Jul 2026 07:43:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785163406; cv=none;
        d=google.com; s=arc-20260327;
        b=ZE4UEiFlASXewdEMgx4QL2y2WisKTpCeYnISQqy4bE6MqUgOYhdoYQURqBzfQmtLy9
         2b61JBOCwf6fWEUIze5g5ut4WkF5hxbIR10Yh1afqElFNwkDb6VZ48fK66wUsWy9PQSG
         vWdj3eu6nLu96xdTadczNzgJAqyLshU2yqduB9Qc52S4upHlnhmTZGtr76O0YxjETgqM
         ddIjUxitJpXkYmvmdsIkOgDrKpxVJU8ta700Cdi+6ZVIEKOcEVCIJaZUFyOw6Bdc7uCv
         ZPKfS9poaUd59gCDltoqGoT1CVDUyS2htAAj/EbS8fMo4Zjy7myCZJ0779HZbeAvzRJF
         fLng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6U7gZm8FAQizXF59ec3aCvJxmKtlXRIVGknWn54r/mg=;
        fh=+Kn94FVzl6rE7mDhn4pFvEHlRshbQ57dQ5o19v04Oyg=;
        b=QEZfPFWQxQxlgdmZiQ0zEFIQcq2oGPy5IEYmTpnbC2UbcdJo2Dr6TUagpKqa9NpvQu
         pSNB0JACnAcDao9d3MPGtQcFeXHSmFc4oCPTIievdYpmgq5fb1FwzRSaa+YbiVqJfpeP
         G+UgwHKQTRZ4nVenm2JNJU1pdI99wAbHljQMisXa/W84IcXCbQZy007Sy79EFVwkzt7e
         WQ5Ex7jroKd8ROGJMZaLtWWRCq5HetNbIUOk3cP302WuueV6w2JM83ywUqv1QyVLns52
         1jUUPTzjpy9HHYEtrLx6+16v9Zs88jrOJLQXYRvGc/y912zGa9rBtr0TkK7A10lANMvS
         fnRQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785163406; x=1785768206; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6U7gZm8FAQizXF59ec3aCvJxmKtlXRIVGknWn54r/mg=;
        b=OjRgYDkTV7VC84ZlRiVgqhQTsOPOLEZUvomxu996ceB5tujrIj/fYWbn/gPvYjRkn+
         F9enlOA2nqiTLCA5vp7AGJftbdopyuWibB+ibnxPqKM42z4RSSBf82pOQvN5RbQfI0L3
         lIa8N4SAmoiiYvy/Dt/L3zSvrCBvduOk+q8WDzKoo5aIQ2Rb0+739ZT/NYzNBDzYGTwS
         /ZSGMQqThOpqsCOD1S8ik9u9P5iwgGqsJ0LK5ZfqvBo3ufbSBJURJUE+mDqiIT1anUCB
         XCJB6DbvSBZDVA7eoMJxCepoOQ3VoX11BgI+pR6+bgRqc+nruH5SuweVGEnkWOuTnzGk
         j4JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785163406; x=1785768206;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6U7gZm8FAQizXF59ec3aCvJxmKtlXRIVGknWn54r/mg=;
        b=boxtY5+nKN17GMY+Ewo0evHSaU6Tz8zieqiF/IPTAyk/+t84J6MQ7/9sLEgW/h7QTv
         DBm/PhWymBu6nLG2Gig12aU/VLQt3fiwZsv89oSneMeJV6SC8ZD48B72Bvv5ldNrdLUs
         UmnKDayR/D7St1fsz494LQxrDOMlZB80zS/vZKztO1QJeuqGs5at0B6sIYltr+eUMoyQ
         a1c2F8tPnsiZt+bcRuA9jBHxT9gMvY5eUYTIabDYoFa3+57VdgjOxR6TVXSleNDoXA9M
         ud+gSedvYSpwOsxgUq/NCOP1aI6kM5fo3zt1QV5Pd2rz5w6ksOFPrwWBr9GEPJkWn9+v
         CXhw==
X-Gm-Message-State: AOJu0YxEC7qUvC5Bkna4zJ9oQRzk5f52FF1E32lJ91wJqns0S3D6Y6Gf
	WLolY2MxIWvdHSYdITfu3xCSVwqzkcMyPrio7Yol7VU/N6+B/UL3NqQjjcvwfnf0abBO/yM1g+k
	LBptOB0DIqhXIkUmd5tOql3kEbFVEZ8tC5w==
X-Gm-Gg: AR+sD13VJMJn+tcUxcMpnJvLqeH+0wb/ChI0mq7VrC49Xj3MJdOLaHBdL7OO9umW1ut
	Hw0fI5QY7Q36UPyWsvcKnwiMqXkakeQso9kmX998oTryczj4K1X6ZpBU57iFtKhL//WPlHvNKN6
	SxFg4DvjitfH9AtSAMBCrfzxLuYj94vR9RDTnQ0+REF+N8qGKbiNWyiByYPCw1noUKFGJMzs+YJ
	mUPA7e+Mu5cEkJ/5X+KnA3BghxO6FQzbwOxB5rw8EZewqYeH9BZ3datQSY6geE=
X-Received: by 2002:a05:690e:4419:b0:668:8dfa:e6bd with SMTP id
 956f58d0204a3-668c79ece45mr1846117d50.28.1785163406381; Mon, 27 Jul 2026
 07:43:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260708165929.2233934-1-tmaimon77@gmail.com> <20260708165929.2233934-5-tmaimon77@gmail.com>
 <20260708171328.164201F000E9@smtp.kernel.org>
In-Reply-To: <20260708171328.164201F000E9@smtp.kernel.org>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Mon, 27 Jul 2026 17:43:15 +0300
X-Gm-Features: AUfX_mxss1gpTVx_iG-EcKgHYOCAVOJbPuT60yTahARgEf9JOKsw8XHtR5OWKn4
Message-ID: <CAP6Zq1hNePS_kPWiTmUvyerv9E9F5QNRwsfkzp1XC5oedt7JyA@mail.gmail.com>
Subject: Re: [PATCH v8 4/4] arm64: dts: nuvoton: npcm845-evb: Add peripheral nodes
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 8 Jul 2026 at 20:13, <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] The device tree aliases for the SPI FIU controllers `fiu1` and=
 `fiu3` are incorrectly swapped.
> --
>
> --- Patch [4]: [PATCH v8 4/4] arm64: dts: nuvoton: npcm845-evb: Add perip=
heral nodes ---
> commit 58cedbdc9355efee860c7d605886caa4e600ea8c
> Author: Tomer Maimon <tmaimon77@gmail.com>
>
> arm64: dts: nuvoton: npcm845-evb: Add peripheral nodes
>
> Enable peripheral support for the NPCM845 evaluation board by wiring up
> the SoC controller nodes to the board design. Add board aliases, GPIO-bac=
ked
> MDIO buses, flash partitions, and enable various peripheral interfaces.
>
> > diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts b/arch=
/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
> > index 5edf5d13342da..7717c3a8f76d2 100644
> > --- a/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
> > +++ b/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
> > @@ -10,6 +10,42 @@ / {
> >
> >       aliases {
> >               serial0 =3D &serial0;
> > +             ethernet1 =3D &gmac1;
> > +             ethernet2 =3D &gmac2;
> > +             ethernet3 =3D &gmac3;
> > +             mdio-gpio0 =3D &mdio0;
> > +             mdio-gpio1 =3D &mdio1;
> > +             fiu0 =3D &fiu0;
> > +             fiu1 =3D &fiu3;
> > +             fiu2 =3D &fiux;
> > +             fiu3 =3D &fiu1;
>
> [Severity: Medium]
> Are the aliases for the SPI FIU controllers intentionally swapped here?
>
Yes, it is explained in the document. Since the FIU1 module is added
in the new SoC generation, we should add it at the end of the
structure
> Mapping fiu1 to &fiu3 and fiu3 to &fiu1 assigns logical SPI bus spi1 to t=
he
> &fiu3 hardware controller and spi3 to the &fiu1 hardware controller.
>
> This contradicts the partition labels defined further down in this patch =
for
> these nodes, which expect spi1 to be fiu1 and spi3 to be fiu3:
>
> &fiu1 {
>         ...
>         partition@0 {
>                 label =3D "spi1-system1";
>
> &fiu3 {
>         ...
>         partition@0 {
>                 label =3D "spi3-system1";
>
> Could this mismatch break userspace and boot scripts relying on the logic=
al
> device IDs to find system partitions?
No, this is the way we use it, and it is only an example in the EVB;
the user can choose the label name according to the board's needs.
>
> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708165929.22=
33934-1-tmaimon77@gmail.com?part=3D4

Thanks,

Tomer
