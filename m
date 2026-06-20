Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59EDD1A7264
	for <sashiko-reviews@lists.linux.dev>; Sat, 20 Jun 2026 08:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781943825; cv=none; b=L3tymJ96SU+oAyCM2bEq/T8OE85d2ylN0cw+SAyuyFigIBSnL/qrhWSpKX6NwFwYwWN67HsL4aPCe6hduFTZd05L+plC51TgTRnqPX6RFqDxUXWA+G7NhVCrvW0Q2w7024fXHFjjuccr0TVsPGA5pov7bLbBFxa+b5fyjRfHNQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781943825; c=relaxed/simple;
	bh=N0yU3/zjU+4R2BqIZN4zcj49MWsY0o1cyH9craVeyBM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dqfPYrWszVyjYnuwYCFc6V5maLyRcKJecTC2Q7Kj2g/sA5wpQ804uqir4WF/5F9KvArF4+FCwLRPIiulMd2oJtVr+1//zMFFttOKIyXguVMa3RzMTEnKc0D3Y6dI6B8L3wY4OX9DzBA+Pbk8OoLLvd2rnyyi9421ZCV6b4m/NS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.100.206])
	by APP-01 (Coremail) with SMTP id qwCowABnB9D_TTZqS1JyAg--.2234S2;
	Sat, 20 Jun 2026 16:23:28 +0800 (CST)
Message-ID: <c52c99917db0f49c39313e23643f0aa9281b8b99.camel@iscas.ac.cn>
Subject: Re: [PATCH] drm/fb_helper: Determine proper crtc_index within
 drm_fb_helper_fb_dirty
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Thomas Zimmermann <tzimmermann@suse.de>, "H. Nikolaus Schaller"
	 <hns@goldelico.com>, sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, Andreas Kemnade <akemnade@kernel.org>
Date: Sat, 20 Jun 2026 16:23:27 +0800
In-Reply-To: <1c9e0e24-9c4a-4259-8700-cf9e5fd60ca3@suse.de>
References: 
	<5118b37e579cec220f2d2b6ab0bb1ecfb67f0d5c.1781803617.git.hns@goldelico.com>
	 <20260618174310.70DB11F000E9@smtp.kernel.org>
	 <50FDBC3B-BFC2-4BC6-B216-78C2C24D9E30@goldelico.com>
	 <1c9e0e24-9c4a-4259-8700-cf9e5fd60ca3@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-CM-TRANSID:qwCowABnB9D_TTZqS1JyAg--.2234S2
X-Coremail-Antispam: 1UD129KBjvJXoWxGr4UuF48Zr15AF17WryDKFg_yoWrtw45pF
	W3JayYkFWkJryrJasFga10va4jk393JFZ7Wr1rGw1rZF90vr1S9F4ayrZ8uFWDur13Xw42
	vr4UKFy3uFn8AF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUk2b7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
	8E87Iv6xkF7I0E14v26F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxkF7I0En4kS14v26r126r1DMxAI
	w28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr
	4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxG
	rwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8Jw
	CI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2
	z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUgtr4UUUUU
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/

=E5=9C=A8 2026-06-19=E4=BA=94=E7=9A=84 10:50 +0200=EF=BC=8CThomas Zimmerman=
n=E5=86=99=E9=81=93=EF=BC=9A
> (cc Icenowy)
>=20
> Hi,
>=20
> there are a number of similar reports. Does the attached patch fix
> the=20
> problem. It picks up what you do, but in a more correct way.

Well in fact I think the correct practice might be combining both --
use crtc index in modeset + skip non-enabled CRTCs.

But anyway the attached patch is tested by me on loongson driver, if
you're going to send it, feel free to add:

```
Tested-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
```

In addition, a bug report with loongson driver exists on the Debian
bugtracker, the Debian kernel team wants the fix to have:

```
Closes: https://bugs.debian.org/1138033
```

Thanks,
Icenowy

>=20
> Best regards
> Thomas
>=20
> Am 18.06.26 um 19:56 schrieb H. Nikolaus Schaller:
> >=20
> > > Am 18.06.2026 um 19:43 schrieb sashiko-bot@kernel.org:
> > >=20
> > > Thank you for your contribution! Sashiko AI review found 3
> > > potential issue(s) to consider:
> > > - [High] Lockless access to `crtc->state` and `crtc->primary-
> > > >state` can lead to a Use-After-Free due to concurrent atomic
> > > commits.
> > > - [High] The patch breaks vblank synchronization for legacy (non-
> > > atomic) DRM drivers.
> > > - [Medium] The logic selects the first matching CRTC instead of
> > > the last active one, contradicting the commit message.
> > > --
> > >=20
> > > commit 0337b26b606b4d905d72ea2be31bcb984fe62c6e
> > > Author: H. Nikolaus Schaller <hns@goldelico.com>
> > >=20
> > > drm/fb_helper: Determine proper crtc_index within
> > > drm_fb_helper_fb_dirty
> > >=20
> > > This commit updates the dirty framebuffer worker to search for a
> > > matching
> > > active CRTC instead of hardcoding the wait for vblank to CRTC
> > > index 0. It
> > > aims to avoid vblank timeouts when CRTC 0 is inactive.
> > >=20
> > > > diff --git a/drivers/gpu/drm/drm_fb_helper.c
> > > > b/drivers/gpu/drm/drm_fb_helper.c
> > > > --- a/drivers/gpu/drm/drm_fb_helper.c
> > > > +++ b/drivers/gpu/drm/drm_fb_helper.c
> > > [ ... ]
> > > > @@ -232,9 +232,23 @@ static void drm_fb_helper_fb_dirty(struct
> > > > drm_fb_helper *helper)
> > > > struct drm_clip_rect clip_copy;
> > > > unsigned long flags;
> > > > int ret;
> > > > + unsigned int crtc_index =3D 0;
> > > > + struct drm_crtc *crtc;
> > > >=20
> > > > mutex_lock(&helper->lock);
> > > > - drm_client_modeset_wait_for_vblank(&helper->client, 0);
> > > > +
> > > > + drm_for_each_crtc(crtc, dev) {
> > > > + if (crtc->primary && crtc->primary->state &&
> > > > +=C2=A0=C2=A0=C2=A0 crtc->primary->state->fb =3D=3D helper->fb &&
> > > > +=C2=A0=C2=A0=C2=A0 crtc->state && crtc->state->active) {
> > > [Severity: High]
> > > Can this lockless access to crtc->state and crtc->primary->state
> > > result in a
> > > use-after-free?
> > No idea...
> >=20
> > > The drm_fb_helper_fb_dirty() function holds helper->lock, but
> > > does not hold
> > > the DRM modeset locks required to protect these state pointers.
> > > During a
> > Which locks are exactly recommended to add? What is their
> > name/pointer?
> >=20
> > > concurrent atomic modeset commit, the DRM core allocates new
> > > state objects,
> > > swaps them into place, and frees the old objects via kfree().
> > >=20
> > > If this code reads an old state pointer and gets preempted, could
> > > it then
> > > dereference the pointer after it has been freed by the concurrent
> > > commit?
> > >=20
> > > [Severity: High]
> > > Does this break vblank synchronization for legacy non-atomic DRM
> > > drivers?
> > > Legacy drivers do not use the atomic modesetting infrastructure,
> > > so their
> > > crtc->state and crtc->primary->state pointers remain NULL. Since
> > > the condition
> > > above requires these pointers to be non-NULL, the loop will skip
> > > the vblank
> > > wait entirely for legacy drivers. This skips the intended rate-
> > > limiting
> > > behavior and could lead to unbounded damage worker execution.
> > What is the solution? And is this important.
> >=20
> > Before d8c4bddcd8bcb ("drm/fb-helper: Synchronize dirty worker with
> > vblank")
> >=20
> > there was also no rate-limiting behavior.
> >=20
> > > > + crtc_index =3D drm_crtc_index(crtc) + 1;
> > > > + break;
> > > [Severity: Medium]
> > > The commit message states "If multiple CRTCs match, the last
> > > active one is
> > > selected." Does the break statement here cause the first active
> > > CRTC to be
> > > selected instead, bypassing the remaining matches in the list?
> > Yes, that is correct. The description is indeed wrong.
> >=20
> > > > + }
> > > > + }
> > > > +
> > > > + if (crtc_index > 0)
> > > > + drm_client_modeset_wait_for_vblank(&helper->client,
> > > > crtc_index - 1);
> > > > +
> > > > mutex_unlock(&helper->lock);
> > > --=20
> > > Sashiko AI review =C2=B7
> > > https://sashiko.dev/#/patchset/5118b37e579cec220f2d2b6ab0bb1ecfb67f0d=
5c.1781803617.git.hns@goldelico.com?part=3D1

