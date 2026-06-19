Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [81.169.146.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3B226B2AD
	for <sashiko-reviews@lists.linux.dev>; Fri, 19 Jun 2026 17:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=81.169.146.221
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781889671; cv=pass; b=eah3OL/fFt4zeFOFi5XmhWIhvt2pZKP0e9M9Xc6ZDaRcBEzzs83fMqUz1Fv58K9S5RKzLV74wZUYybgMPY3+skR+e6m9/JIUPod0baAeTzC8g+MtcxrXTtSgQq77I9XDX+vir8EIpoLxS7i+95MUUJ7WZFbf6jiUwmSZlV39HE8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781889671; c=relaxed/simple;
	bh=NkCuyHKA475pm8MMGSPylFmgWbkQ49DTcM5GNi67nMU=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=TDEgfG+LWV6BnvF3YCqCukeh2+/x5//ezQ/L34g52j4rm4WG7YmupdsZZ1Cu/7DwoimBvbYOEJBL4e3mus3nFbVhMbCFGMXkl+4WYPU/gvWXd7BxMVVMHMrDQlbxOdoiXBUkzEfQoPiLvBXeu5DHIEAeXdejPisEwas0Xx95KvQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=goldelico.com; spf=pass smtp.mailfrom=goldelico.com; dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=dxA9BEdC; dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=nv8LpHQp; arc=pass smtp.client-ip=81.169.146.221
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="dxA9BEdC";
	dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="nv8LpHQp"
ARC-Seal: i=1; a=rsa-sha256; t=1781889482; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=SvtzZD13tUbY+NO4sA+tQrFpJaXs07CE7G6QcyWyL40KhcsWapLaIs+x+Za/XYZCsI
    bdwN1/uciAp8jg4x8FXzzM7igo6B3XHhpNjIRIoECn2FM064eQW5iaABnPIpRshFFpQ4
    3XXLWf8s263oLe3wE/pyiucWMfbCbQ9GbpUcIMTEDdOSVYK9HfGn+9xu5KTc5/XPvfE5
    lFST8LZR8Gkk/ZHHv8uk88aD+bn/d1efgStiKryPBvDlhLIMIo9xR2vg3iQqW485A4Tu
    W+MUWcLgz/iiyN4LJ9mpOvYYO9uwcTDUSoJmTsUhXFjtjX86K6bnT+B3lusXy+ecdDLQ
    CDVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1781889482;
    s=strato-dkim-0002; d=strato.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=NkCuyHKA475pm8MMGSPylFmgWbkQ49DTcM5GNi67nMU=;
    b=dpI6RIULdyCc4gFMIA3mGyC34e8ybAhkT/n5B/NiGfY0/mxlInbZz9CMUhEB53KBXG
    VyzKpmRY0o25sOchJpQnU1PCc4O2oi/NdOwVLcyvAZzcn6HtptLlreSI/drbIe6c52OL
    Vy6MPEh5jytfY9wsjCEnSwf1WXFjojNPBtevM2a3MNINqIWMmQIaiGCGK/kIgVOG/ay5
    rzqKHvLu2JHCW2BOLDpzBu3C6f2m9vpOrJY1mxVIC4EgG7YdALcb/JAKD6sNyyzLVrXA
    fx51oWj6dj8guebcVdlpdAGVzE5srrZrJN64Cxt80/I1cmCY/FTXShqKenvSc2zI54aR
    Rjag==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1781889482;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=NkCuyHKA475pm8MMGSPylFmgWbkQ49DTcM5GNi67nMU=;
    b=dxA9BEdCck/8HD7K4ol37kUUttpOwQnTIvtGp1C15pn6Ox1XyXkRg0mRlBscbYqSr3
    6pSQ0D9v+QXEE1Zwr8UtasaUEYZ1+QWcRwVNoTt5GQI3H4+N8ifBut5FzjbbQIhq0fx2
    ibHx8tLm0RM0aW7m9o0iMUBJRbvOaGl6XWq6Zwwi6+MvEtZ3rMSgxFDUTFElH143inNK
    Jqgqx66Cn88/ypFHT5TbTbzbDBSMH5xWZZtb/9pZqDdLTehY32xbJVGB8jS1xpSHchBb
    7TmnKc8w8ZewpMbeAt05e5yhoCCDip7ID9HOEhmkIFV7qONlTznAL95YH7lFLrImfzVc
    maKA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1781889482;
    s=strato-dkim-0003; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=NkCuyHKA475pm8MMGSPylFmgWbkQ49DTcM5GNi67nMU=;
    b=nv8LpHQprR9uqr/eFiXQoXUWCWqh6OciHCC19hPiKvDw/8qc+8tYaI8n7yF8Gz/eFT
    djtyzyvtdnpsxFGeyPBw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrQ2ppZzsiNc/fOFMhUadUzANaCP/08tKGRQWc="
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 55.0.1 AUTH)
    with ESMTPSA id Qcf97c25JHI1jmb
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
	(Client did not present a certificate);
    Fri, 19 Jun 2026 19:18:01 +0200 (CEST)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.6\))
Subject: Re: [PATCH] drm/fb_helper: Determine proper crtc_index within
 drm_fb_helper_fb_dirty
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <1c9e0e24-9c4a-4259-8700-cf9e5fd60ca3@suse.de>
Date: Fri, 19 Jun 2026 19:17:51 +0200
Cc: sashiko-reviews@lists.linux.dev,
 Icenowy Zheng <zhengxingda@iscas.ac.cn>,
 dri-devel@lists.freedesktop.org,
 Andreas Kemnade <akemnade@kernel.org>,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <D08962D1-4D1D-49C5-A60F-89CB7F7E0378@goldelico.com>
References: <5118b37e579cec220f2d2b6ab0bb1ecfb67f0d5c.1781803617.git.hns@goldelico.com>
 <20260618174310.70DB11F000E9@smtp.kernel.org>
 <50FDBC3B-BFC2-4BC6-B216-78C2C24D9E30@goldelico.com>
 <1c9e0e24-9c4a-4259-8700-cf9e5fd60ca3@suse.de>
To: Thomas Zimmermann <tzimmermann@suse.de>
X-Mailer: Apple Mail (2.3826.700.81.1.6)

Hi Thomas,


> Am 19.06.2026 um 10:50 schrieb Thomas Zimmermann =
<tzimmermann@suse.de>:
>=20
> (cc Icenowy)
>=20
> Hi,
>=20
> there are a number of similar reports. Does the attached patch fix the =
problem. It picks up what you do, but in a more correct way.

Yes, reverting my version makes the issue come back and after applying =
yours it is again gone. At least in the scenarios I have tested for the =
PandaBoard-ES (boot/reboot, unplug/replug, second display or not).

Should I take your corrections and resubmit or how to proceed?

Best regards,
Nikolaus


