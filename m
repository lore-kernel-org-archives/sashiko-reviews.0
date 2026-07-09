Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E075C3B42D6
	for <sashiko-reviews@lists.linux.dev>; Thu,  9 Jul 2026 19:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783625248; cv=pass; b=tkfoi/TiTOTZGws1vB8JuHQ/+FencHpqgpRlzmkkCGutKjCmYBmOehYDgWkGPiz3IpDKRhAg3mXMyFRw/1S8bDYzx4s3GMIaHKWLqqa0X/iecbRqyoNu0dH7CajpKTyiPsfZvORrm+VowRpya6DcA4dhIbJGgKA0lqiLkT8QMuM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783625248; c=relaxed/simple;
	bh=rFm8Ygno+BsK+0G1CsSFXZBS42iO/5RIV18Ghl0Clgk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H+ucmU5JpUGDhRvPLUyXzjLhJDzzg86Odpg8FHs83sQgaIOZSsJ0/NWF576jrpmvf1alpsPdtojRTVyReRc0/xprEfCBiJgYYPDSgRh4JtUPKSNVlTZRnKtTnvkIgaPt0ps0uoU9SL339IyTkW73MaiR0/aBif4IuYDd3Af7sXA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=m/uaqoc2; arc=pass smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="m/uaqoc2"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5b0077d7053so17e87.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 09 Jul 2026 12:27:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783625245; cv=none;
        d=google.com; s=arc-20260327;
        b=lXzQckNznAXJ3b26129RPLTkkd4J3CMvZ/m+sjiELWVrBeFsgTxOVGTUptZ0zGWVOj
         8ETIMbaZfvVs4kVyPzVA6YTUDFkGbRhXTjEHPQaOs9iPdTnB/r1oKz+ENIKw8eORPg+X
         6WeTlj239hoKYogW4xGSGOtez1HbXOsHK9y8XGOhO2RU+1/7MC9NrKcFXHlpv8GLBXE3
         PfvwQ1P8BF3iR8am0/g5igUy+v4ZJQcaBRI+iPUx0OECVcIrULDpFG0cSZFcvFwfQei8
         Me1WUw5XfDxvFnCyNNzo3FOk6kHfraFXBSXaNCd8qF8JHa8MlS3UnSAbKZZObaaECQzb
         JOVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QeasUUn+gjdu9isr720YSr9OdEALSAsIQjhv2qGp/vs=;
        fh=fItrUtV5UsY1KSNx1ZNnzv3miYMbODbRRQWQ18AP5Zc=;
        b=U74nAvIVWc9qUmHLsv8pB6rjpjj7Fg09AeQLm1tjp0Ui9GBXcOgenNLI1crQqXkNUP
         HsNaldumYGRgRBqrqnKJylOwDI+7Ki1LIOZvQO02N8gxYp81G/NXDsv3lDNfXjNbP+lv
         MpTqMrzQZVcjebc6WJ+jIDbDMCFt4zYB9xFTDVpeLZ4ztEUwbMTViU3gg7/FoNRUCxG0
         ro0PGjsH+Is8uwxsvbCK2X/gVCiasIr+Iv9/4U8+1l3ZkSOWfugGWMM9iEXlcbNay7i6
         DmSf15XvtKAL3/LurVXIOz1YhT8soTE3L8cSIRlpkE1LGvOh5fcGJJgtxOLUSZZJkcEd
         t+1w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783625245; x=1784230045; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QeasUUn+gjdu9isr720YSr9OdEALSAsIQjhv2qGp/vs=;
        b=m/uaqoc28Oz9pl8XD1e95ryCAJAYYmDPCnm7jeeVtSJ0b09qYfZz/nl5qQtRKMzNvK
         uh0pxUZ2rfgwijt2IZgxKrb/6Y+YbHmEaykHjhIZ4kyBBsCuQSXTJObkUanxZmbTX9EO
         eqw4sIlPhnFU2tbI24vYwjlFO+CVBzmU79i20nQOR1WO9fvmFcIj3Im/HCpDVidt7y1P
         FCF0wtNxVCXsboscvLywfg2X8u8zAqf9rv1WSErkfE2ZrFAzOQiAjPPrwKwcksO5rCFs
         DusrQp3NkCO+sWG9swTwD/OJTBMSyhthNoPqv8YY7flNc2qa2ZLpVTwrVHOGGKFXh4eB
         4EzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783625245; x=1784230045;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QeasUUn+gjdu9isr720YSr9OdEALSAsIQjhv2qGp/vs=;
        b=V6ti/pUMczrfPJj2LLRg23OBkHJMdtmea0nSnQ0iQMOee51GL1S/r4XsMiipqYu1oR
         GOWMUnq7tIAq9xCMQ8LMgaK1ydFOQ9IXlQ8pLkPjeqkr0wzVlEeIhFloXgoA95tK4ejd
         zADujlWjTzY9wjCNVbAj2pyJNBfYBlcz0h7/RyroY5p+L3LpuOtBfhCIyHJGxyiiHNSj
         t+XzLspEO8xWifUWMAYJVlWy9pH90SSCU3f/1ONou5HvBXQ6KgRQkFQONsIinyt/A0ym
         I5OELSB5+mWhUw52b7DKPPFTzHAZyNX92Nb25XwCGxNd4m0ZLfke1bU+Ni872jd1Hj2C
         wdlA==
X-Gm-Message-State: AOJu0YxGWbUpnRiprPazReNaWla4GSxFVcyI+9hR6TEudkiUezMR4lN9
	imSnsueUU1EtX9QqiCvJ9lS4KWnFp7bbJl/ABJfbhKlhd/sfy5S9/nbkG4wFSL8/0NvIE95N/IB
	DzytMPBL8PS/HAC7iTT3oyVAduK4Ud3u24qBt9xbOw+nyc2z/5rJ6LHM=
X-Gm-Gg: AfdE7cmhzaURex1wBKw3ttQ+70hoMXTopX8Amoiy/2CBGpOVq1Z8BeNgSC+vcFBbYSy
	CaiLRJcERsJEX0/D0/G+FawntY3kuSAg/B98Sr2aSheK6yDjpfSaV68NnS2pRiApi+QUtbCE8/I
	ZFS6N24yojX8IjoQVJzr5/10SMJsTnWmK6tM2vE1lElA549Ut0MESkmo2D6JWNaYGZKB6M4Iyl0
	xTv/vhCrxN4MqTCt4SUeUV6Xvcu+xNZ/jyfO2eo2lGNuD6mEmQ5hSkyyjpn6Ckp+poi
X-Received: by 2002:a05:6512:1324:b0:5ae:b59b:c65e with SMTP id
 2adb3069b0e04-5b01c5cdcdcmr31389e87.4.1783625244688; Thu, 09 Jul 2026
 12:27:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260708-igb_v3_b4-v3-0-1272650ca614@google.com>
 <20260708-igb_v3_b4-v3-2-1272650ca614@google.com> <20260708232808.184BD1F000E9@smtp.kernel.org>
In-Reply-To: <20260708232808.184BD1F000E9@smtp.kernel.org>
From: Josh Hilke <jrhilke@google.com>
Date: Thu, 9 Jul 2026 12:27:12 -0700
X-Gm-Features: AVVi8Ccd9CIfVYUXuByu-1VzHQ6_1RCBW4NsLsV_vmNKVvn4uyCUkBnvop3DQiQ
Message-ID: <CAAdrzjsxv-neCiK0qCUsRnei5oY7sieuSLa=Yu+ajJLUF=MxKw@mail.gmail.com>
Subject: Re: [PATCH v3 2/9] vfio: selftests: igb: Use PHY internal loopback on 82576
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 8, 2026 at 4:28=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] The commit message incorrectly references removing and keeping=
 macros and code that do not exist in the baseline or the patch diff.
> --
>
> --- Patch [2]: [PATCH v3 2/9] vfio: selftests: igb: Use PHY internal loop=
back on 82576 ---
> commit 2d54b65042a5cbe6702c330df52d94e7c2ff3b57
> Author: Alex Williamson <alex.williamson@nvidia.com>
>
> vfio: selftests: igb: Use PHY internal loopback on 82576
>
> This commit replaces igb_phy_setup_autoneg() with igb_setup_loopback() to=
 use
> PHY internal loopback on the 82576 device instead of MAC loopback, aligni=
ng
> with the datasheet requirements for real hardware. It forces the MAC into=
 1Gb/s
> full duplex with link up to ensure the descriptor engine runs. The patch =
also
> maintains compatibility with QEMU's emulated igb behavior without needing
> environment-specific code paths.
>
> > The submitted driver also wrote bit 14 (link disable) to PHY register
> > 16 (port control).  Datasheet 3.5.6.3.1 describes this as required for
> > 10/100Mb/s but explicitly "not a must for 1G", and the kernel ethtool
> > selftest omits it.  It is dropped here.  Flagging the removal in case a
> > future regression bisects to this commit.
> >
> > Remove igb_read_phy() and the PHY status macros it served, which become
> > unused: IGB_PHY_STATUS_REG_OFFSET, IGB_PHY_STATUS_AN_COMP.  Keep
> > IGB_PHY_CTRL_AN_ENABLE and IGB_PHY_CTRL_AN_RESTART for the QEMU-only
> > autoneg kick; add the PHY ctrl loopback and CTRL force-link macros.
>
> [Severity: Medium]
> This isn't a bug in the code, but the commit message references removing =
and
> keeping macros and code that do not exist in the baseline or the patch di=
ff.
>
> Looking at the baseline code being modified, igb_phy_setup_autoneg() did =
not
> write to PHY register 16. It also used standard macros like MII_BMCR and
> BMSR_ANEGCOMPLETE rather than IGB_PHY_STATUS_REG_OFFSET,
> IGB_PHY_STATUS_AN_COMP, or IGB_PHY_CTRL_AN_ENABLE.
>
> Could this part of the commit message be a leftover from an earlier versi=
on
> of the patch series?

Sashiko is correct here. In v3, I updated the first patch in the
series to import the real IGB headers, so the macros are now
different. I'll update the commit message accordingly for v4.
