Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4294A360EE9;
	Mon, 27 Jul 2026 02:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785119381; cv=none; b=mgOwBDX1yxdfscGOjvRskPhCiYvjb85w1LBiH9DgH5vtoj8vIgc5lHqqTzl9i+zS3rna55iz5Ecuu/foE7pge0TmrajMnZi+JzB07Io95RvvMaA5o7cBgsM3/yjT6vtqaziIZcjMhuQPBYe2528M+SmCn0zgrC/25m+c+HpsKfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785119381; c=relaxed/simple;
	bh=RHKiLBJnNsuba5Z4tK73StKXHmCjpFp2chkkd2ZfHbM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=J+P0kOgvzSCTCRQOH5kMpCHkpHpa/pOMKKwG8l7GQ6JpJbb1n35Vcc3ZJVrAGwUfqpoP+Xq/Zz5b4Y7GK6RZxqKBac8ulu0QIij4SIcrTF9Jbsob3x2lcWy411OYZbvZXppypMJzBtkGqqh0pgn/EcCxD4wZGfMMEopr+1VulQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=linux.dev; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Jul 2026 10:29:22 +0800
Message-Id: <DK9001Z5AWUJ.1ABF188YEUKGC@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/8] drm/aspeed: replace struct
 drm_simple_display_pipe with regular atomic helpers
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Ze Huang" <ze.huang@oss.qualcomm.com>
To: <sashiko-reviews@lists.linux.dev>, "Ze Huang"
 <ze.huang@oss.qualcomm.com>
Cc: <dri-devel@lists.freedesktop.org>, <Frank.Li@kernel.org>,
 <imx@lists.linux.dev>
References: <20260727-drm-simple-kms-removal-v3-0-cd5dc89858c6@oss.qualcomm.com> <20260727-drm-simple-kms-removal-v3-2-cd5dc89858c6@oss.qualcomm.com> <20260726195914.12FD21F000E9@smtp.kernel.org>
In-Reply-To: <20260726195914.12FD21F000E9@smtp.kernel.org>
X-Migadu-Flow: FLOW_OUT

On Mon Jul 27, 2026 at 3:59 AM CST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] The driver fails to trigger a CRTC modeset when the primary plan=
e's framebuffer pixel format changes, causing the hardware to incorrectly i=
nterpret pixels.
> --
>
> --- Patch [2]: [PATCH v3 2/8] drm/aspeed: replace struct drm_simple_displ=
ay_pipe with regular atomic helpers ---
> Note: The format of this report has been altered to use a free-form summa=
ry
> due to code recitation restrictions. No inline code quoting is used.
>
> commit 82b41ef8182b1e0fe64dd5371b72b906d9c02892
> Author: Ze Huang <ze.huang@oss.qualcomm.com>
> Subject: drm/aspeed: replace struct drm_simple_display_pipe with regular =
atomic helpers
>
> This commit replaces the simple display pipe with explicit plane, CRTC, a=
nd
> encoder objects. It moves callbacks to plane and CRTC helpers, wires vbla=
nk
> handling through drm_crtc_funcs, and uses commit-local state for programm=
ing.
>
> [Severity: High]
> This is a pre-existing issue, but does the driver fail to trigger a CRTC
> modeset when the primary plane's framebuffer pixel format changes?
>
> Looking at aspeed_gfx_plane_helper_atomic_check() in=20
> drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c, there doesn't seem to be a chec=
k=20
> to see if the pixel format has changed between the old and new plane stat=
es.
>
> Since the hardware registers for the format (CRT_CTRL1) are only programm=
ed=20
> during the atomic_enable() path, which requires a full modeset, a format=
=20
> change during a simple plane update will only update the DMA address in=
=20
> aspeed_gfx_plane_helper_atomic_update(). The format configuration in the=
=20
> hardware will remain stale.
>
> Could this lead to corrupted rendering if userspace changes the framebuff=
er=20
> format (e.g., from RGB565 to XRGB8888) without changing the display mode?=
=20
> Should aspeed_gfx_plane_helper_atomic_check() explicitly set=20
> crtc_state->mode_changed =3D true if the new format differs from the old =
one=20
> to enforce a full modeset?

We can force a modeset when the primary framebuffer format changes:

	if (old_fb && old_fb->format !=3D fb->format)
		crtc_state->mode_changed =3D true;

With drm_atomic_helper_check(), this also needs a second
drm_atomic_helper_check_modeset() call, because modeset checks run before
plane checks, similar to [1]

    static int foo_atomic_check(struct drm_device *drm,
                                struct drm_atomic_commit *commit)
    {
        int ret;

        ret =3D drm_atomic_helper_check(drm, commit);
        if (ret)
            return ret;

        return drm_atomic_helper_check_modeset(drm, commit);
    }

However, I would prefer not to mix too much unrelated fixes into this
simple-KMS conversion series. The old simple-pipe code did not force a
modeset on framebuffer format changes either, so keeping that behavior
seems fine for this conversion.

If needed, we can fix it later in a separate patch.

Also, ARCPGU may only support programming the pixel format during CRTC
enable/modeset, not during a flicker-free plane-only update. If so,
changing the plane update path would not help.

[1] https://elixir.bootlin.com/linux/v7.1.3/source/drivers/gpu/drm/imx/ipuv=
3/imx-drm-core.c#L40
