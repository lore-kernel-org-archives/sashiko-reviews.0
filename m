Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C703630B2
	for <sashiko-reviews@lists.linux.dev>; Mon,  8 Jun 2026 22:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780956207; cv=pass; b=kXBFl2BP3JMepQOaVTiAy2/UGm5NYiALIJYL7wiAlWkdBR9X0z0ZZIb5kVp8bGfodCUihqbqVmMcggyKHkbqJ3tSe6C90ddSFlylkjuFGgT3A4EyxFWlhry5R8T4y6WPAvLpC5pe6YainUzBiDyW6WuVLi1bQXghWIN+b+Gk6sI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780956207; c=relaxed/simple;
	bh=GnezBpdD+ckp8obmbhW5EYyO47hkUHBLAMCqTa7Fa8o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ii4jhIOvynf0byQilENm7rQ9A46T8Nwjm7xm1AcaLqj1RXuPswVxoJaHS2S++xLttwHdzePOfMiyjWyZL6aSm4++fXVxoTgyajzvbdSimVz4mSdBqjHVB2RhpLbYYBTzPqeap3w8nljBCn77Ds+3Vshalrk+A75vnLIVxiq0Axk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=U/ruXVbQ; arc=pass smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="U/ruXVbQ"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2c0b1a48855so444045ad.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 08 Jun 2026 15:03:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780956205; cv=none;
        d=google.com; s=arc-20240605;
        b=dLNFBsS1pVvEAjCoR8bKmkP+Zg2AoYWQRx83WT8cBK31lgTJkCfdxrOiLs7PRVf7Dj
         JuMWFb4CoEgwxeS3ilMogj3qbu+8WlKseirBknzpntrXCcgdim5BYDt0Vex6LGjkCWGl
         QpAGSUZxdfPO4DEyRA9e5gztEhOUi5rvHYXtLpX53XzmuHP5qGyy5vxbI72f1DoK9AK1
         4nisOaqQyRZmc/EL44boeSCp6+K/TslLu1Ry6qNbJuZkFCl85dVbsshVF4PmLEXLcpn2
         VdiBfHAn5GR0NIeyD+kQtLafnr5eNw7iuIMYu0ypwSX+obr7ESXuR6h/ypYWRzIzqvUk
         oemw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Td9/E5f9V6aXQ0cuox27S5GUKVxy5gX2ycYw8xHBNKc=;
        fh=t8A9dPfrPNT5ibK7Ec6z8jBEDhCNM+VF+O+EufSncJU=;
        b=M1m8zJfWSzuLewBKG2GNArruC1EXocWWPxy2bH3FRjAr3ECqc7DzjUTfLM+WPkIQb/
         +niHKbAmlxBEn9CK7reVMqvCbWesxU48ApFhyMdv6VvQUuo+sbemQJwOmFcRr59pK/jA
         PDYPa9jwSAKa04Wzlg1JOVypxX+s21Zj9cUzY8TcT9O2AwXewfHGtBnz9v8D3uQSADwt
         IfHOnJde+3PlJkyJ4T2eRUbripfzlsv9ZHE3xIiG9Q8AMhgTgKRsTLcJpmkyQquoehpN
         jLCvXBXFhbuhANKeA9eOIlxDvToDSOm/Az07Y6Ra5emQKwBELOVjZH2saJx4LcaZOf0y
         SqFw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780956205; x=1781561005; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Td9/E5f9V6aXQ0cuox27S5GUKVxy5gX2ycYw8xHBNKc=;
        b=U/ruXVbQjw3Uu3RUtU1MgfaDuR81aRuOCHUWclZ2eydpZ4QP8VFtPJgYYLf5zibsCf
         Hzlte6A/6uH6Q7IMaCYcVZENiFyZHCITrAbItqBCySG9vS+hCF22vJiqXGPBgUt4OzlB
         7eyjMQ7IyaUC6IhtJSY251jWWM/aIZfw3ibONpuRY1G2kYDJdfDPRRg52pITxaKnvnY3
         nZRykS/fpKR3e9pnOj9o7qBV+oxKn9UzrFB/UrTK2I2vRyEiN52uQZLWGvu8r16/LGJS
         ipWwS+ztRDJDJ/wxUo6mKtDbUmPCEg6dzYEHp3o6GKIidOS3CUMCd/kVSGxIQY8rt5/1
         ceqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780956205; x=1781561005;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Td9/E5f9V6aXQ0cuox27S5GUKVxy5gX2ycYw8xHBNKc=;
        b=RMLaxoDNrUqfJQwj68RUrwPdaFt2khWJ6Ticg6w5PVV+jb8bAJPGAf1F0NIqkwrKQw
         /2bxv6u15dLmwuRjDq2p3Rmr60gnU5m8G4oeEviLTUgOJGgIiWbYRkCtIMYKGxHv5OY/
         DXQcbDvoAM4sVX3grdMdBttIbz9o4z1SxSi8DN9ggXCOwzpAMLz6cAbt45Ej3uakshjq
         hLiiUmI65bCV4dTxDlXlCkX1BHWcMKzckR1c9LuX8hZnEW5sCuzdBrKdRhzcLYr9iuLQ
         NSHLf4OJQkgA/CRfDxkW7xsVmPCpGWRNzZcmGCqrEozNHFEs86j+J2B678sRZ8oBnwTj
         g7IA==
X-Gm-Message-State: AOJu0YyEn9/EmYuMu5ZytN4v3pPZlSYlmov2GWpa8sFFlsdjsrxBPKU6
	t5m/7+rEBYaRm/goG2vwATI5+rtaTS5Xm88nM6dtmbefCCMgbjxwyRGHjv6G3LgHN356UIIqm95
	ZS9Je58wXODrf8E2DrvaAO/jKM4Lhxq/Q5eQpdd7yAi1EnbRSd6epKZUM
X-Gm-Gg: Acq92OFcZQJp/yYB2FXSOL2rYF2EdcUsOLOEOYkxM9aySPgYG18RiLk4FwrlBzHHJPV
	mjRbn9PU45jorb5LKE31XzZHrGh2qzuX1Y90OlFjE7abjexZrqU3+yvT6A21F3Um1vhg3KyAmLS
	uMZjj2Dz1GMJtbeyVQpxd4op1mgQlFCCtfhRV1/lZPla/nbNrD4v5jyx5lWILW6b/bfa4QoUopt
	kAvUQLKi67YJ2IpDQ4LcrGFAi4jVyIZQxvQb2fFAC/9T0OYiL2DAZynxP+ChYxlDDvi8HaImzzo
	hBNnaSfzo2a51vZJpc0KVkgsK8z5beOrxDxPofNMfdzY8YfN
X-Received: by 2002:a17:902:d583:b0:2b9:a39a:e5db with SMTP id
 d9443c01a7336-2c1eb742bf1mr6324125ad.7.1780956204854; Mon, 08 Jun 2026
 15:03:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260608201753.1979464-11-acme@kernel.org> <20260608205059.7ECD01F00898@smtp.kernel.org>
In-Reply-To: <20260608205059.7ECD01F00898@smtp.kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Mon, 8 Jun 2026 15:03:13 -0700
X-Gm-Features: AVVi8CfD2DVec-bEtIZMfcyfb1m__IqqI3l50f4Ca8Zyxp3CE1PRAkHyt_q-Td0
Message-ID: <CAP-5=fW80NxOXjDRUJsn9Z35CahcXxwUs8sug=eTBxA_n3--Rw@mail.gmail.com>
Subject: Re: [PATCH 10/11] perf tools: Use scnprintf() in build_id__snprintf()
 and hwmon read_events()
To: sashiko-reviews@lists.linux.dev
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 8, 2026 at 1:51=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] The early termination condition `offs < bf_size` is rendered inef=
fective by the switch to `scnprintf`.
> --
>
> commit 0dbaa7b9065f01d9d8a6117248bffa97b3021ddf
> Author: Arnaldo Carvalho de Melo <acme@redhat.com>
>
> perf tools: Use scnprintf() in build_id__snprintf() and hwmon read_events=
()
>
> This commit replaces snprintf() with scnprintf() in build_id__snprintf()
> and hwmon_pmu__describe_items() to prevent accumulated lengths from excee=
ding
> the allocated buffer size and underflowing the remaining size.
>
> > diff --git a/tools/perf/util/build-id.c b/tools/perf/util/build-id.c
> > index 8c0a9ae932aa5..a3b92108f9626 100644
> > --- a/tools/perf/util/build-id.c
> > +++ b/tools/perf/util/build-id.c
> > @@ -94,7 +94,7 @@ int build_id__snprintf(const struct build_id *build_i=
d, char *bf, size_t bf_size
> >       }
> >
> >       for (size_t i =3D 0; i < build_id->size && offs < bf_size; ++i)
> > -             offs +=3D snprintf(bf + offs, bf_size - offs, "%02x", bui=
ld_id->data[i]);
> > +             offs +=3D scnprintf(bf + offs, bf_size - offs, "%02x", bu=
ild_id->data[i]);
>
> [Severity: Low]
> Does this change neutralize the early termination condition in the loop?
>
> Since scnprintf() returns the number of characters written excluding the =
null
> terminator, `offs` will reach at most `bf_size - 1` and never equals `bf_=
size`.
>
> Once the buffer is full (`bf_size - offs =3D=3D 1`), scnprintf() will onl=
y write a
> null terminator, returning 0. Because `offs` stops increasing, the condit=
ion
> `offs < bf_size` remains true. This causes the loop to continue writing n=
othing
> for the remaining `build_id->size` iterations instead of exiting early.

Looks like a "-1" is needed to address this.

Thanks,
Ian

> >
> >       return offs;
> >  }
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260608201753.19=
79464-1-acme@kernel.org?part=3D10
>
