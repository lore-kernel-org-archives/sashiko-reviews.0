Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793110263;
	b=WjYxc8JwkXDKD36yrhSARiygFXUZJzAl3tlCzWICjlaDhg7H7ahjlT4UylziMF2bMlfx
	 l+BOvL4ccLoSZAWT5lWNFB54gHzZcp8sOACHRzd6Tn/xZ4zSbw/hB9Y1D1QiHjznKszOT
	 26KUN1QHyZg5zT9JAhSvM3tYWvAEaJPFZhkeDJ3X+ArsfmzhQYbfmcQU2A8RTOsd3RHw0
	 u0DD9+MV9ebggjMEL5J2Zw2rCAFY9qJNiy/wAU/BMcfuGORu8owPAqQK4nCi7fcKTW5VT
	 AMiC/0Ett/P/xThvKl4NtqwjB4ngyQL3svbl2pxpAIN0ti2R1TiGhXoOPGWhCrzVssQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793110263;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=n3PsL6sMIPlUBnMX0/2Kvdyl0GgdzxTtG4W14Mwv2Jg=;
	b=OTgZBeUlANWbg0GP3VJWY1ZhdJEPb46jylP2vgG6YZaV+paSuP5FF4ODsniFvplvW2BZ
	 KhDH4L3koY96Ht2bHy7SFS18EM7rRzX8GUp8fHvCAeklVuY82AZk1p+yVRw2dgks/Rzu7
	 14ET4laq8BjWPsUpy28XAwlJhbR+JXspF5wFrShlfchXP2ogQT+xe1+v77jYbrxuyI0Pq
	 kQwEQQJZqKJL1NwI1cKjp271cSkNz7Gsux4qmkEa1QLIGBWAOiVWBs1ztfgptcwHHBRfQ
	 G40czrcn0odO/XEDbtmPLRGlj7iySgtLDPKpYf/C8thJ5icpAySpMuNBvSQkqxuTskw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ifYAmOIk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A31606A31B
	for <sashiko-reviews@lists.linux.dev>; Tue, 27 Oct 2026 14:11:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80A31606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ifYAmOIk
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c4550d8ab15so546034266b.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 27 Oct 2026 07:11:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793110262; cv=none;
        d=google.com; s=arc-20260327;
        b=fQIkIH+HmSdc78VFh3Ts0nrVhC5xsOpjfPxeZilDdWUH74g2oDxs1Vqy2WZHbaOYIp
         Z2nI4ph6hA97GfAIiLtHy8wISjCIUTt3QgdHidpf5sWHtixcRmX6zQhtsgeQLZQZNOPb
         xREexgTUk5qnamFrSentSanPIMtTITMqJewU3J7MbXWwpXVeW71lAh6WXMMXIPJom+7c
         /n+LchoArgfSB7NozEVlkXEGqTivU1eTq33T4W1TmdAsCbKe3i20zZJrBdr5DU+jL7Oe
         WvvKm/m7PDS3Olx7xybnVAojy/hoo8YO0Xt1u/eAY7/6p3O6Rg2JLHqJopr6pdXZxH70
         l03A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=n3PsL6sMIPlUBnMX0/2Kvdyl0GgdzxTtG4W14Mwv2Jg=;
        fh=bN3WHTlzXcVIr2RkgMpk3NXK/DwXOefqRaFpMbeYf7s=;
        b=fK3J035UTqLuC0pFb7L4iZYH5u2saeQyN9idIybN5tfLOMnGv9KebNaP3PA1dcsoQv
         QvIoB769CZWl44J3ocLKQn8fl8VxwY4GCRC3nlLacsHHPTgbV+uxSjeowkW+83g+WuzH
         8G1zRnhSB0c6p7VnIWf2vhXwleMS0UxCBIuZvEGiEzEJT7xw3AbS4EJPvRplingmxTle
         34OUO00677VokYP9BUlY37dGMQqyNfYlbv5AppWvEqFLO92Mn6XKqjcknIdd70JO6jIv
         F++Qd3tgdBWXjAs5bK1TSLhSGDdItorIbCJz5Bn59ZdMYDe7Ulf4RDBF8D5Wft4CDY3W
         qqsw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793110262; x=1793715062; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n3PsL6sMIPlUBnMX0/2Kvdyl0GgdzxTtG4W14Mwv2Jg=;
        b=ifYAmOIkHGifOzeAR6e770xEY3jfqqMLkX6ASJAXuUkldXv4OfMiJxOCc+yrgQrmS9
         fVJ0CHmhREWAo7WVm3qV5I7HVEVA5U0ZttYMtPz+Wd6xvxWqwALUB9bBlbfqZHwUlrS6
         A4t3XbEN3u3znGcEnb35KwhC/tyTItZ0cImKoY47xaIVK8pUev9jK3OC+a4+XcLF8bj5
         Ga3BBWYUFiI1jH+Wgo87dhXZs1WBMdrhnYw+Whka6eqSZrT7XKeBI//a0cgJWl5w1v9H
         PdPHAERwVwLaWo7Iz0FK+M/gjaETGAUKmtMRGoujUl1RGysPrl/SC+tjvUSx5TQV9Wfd
         5oMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793110262; x=1793715062;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n3PsL6sMIPlUBnMX0/2Kvdyl0GgdzxTtG4W14Mwv2Jg=;
        b=rWfb3OYg2lJzTZWgr+wfgr22A+f203JnBRF/BPqOzLppDJMJjeJkk4aRSrSBZThRDY
         HS5h0V3x6ZGSF4ICly1qNvIWdPVRqI4h65yc0nYhN5C6tmh9MdCJiO5kZXSVIujcv8kI
         BlP8iT59Ba6pfS8DLHNQJ7eu8T05t9SVEaBy80NjuZPB3yapaTcuOwR1SIC+l9zdie9b
         KkXLayp+YWWA/8aufywHPj7ARg6tQQtdTdnTswDIqGCreqi/0GEdC1NmoUhgtMyATTZI
         FRdTfUq38SRcru/Sek0WYNcOmZT5m4R48F6bc9NkNHkZQbHRc1eOUm161c6DMulohcCn
         DCKA==
X-Gm-Message-State: AFq9FYKCbBv4zOlYc19/umRpP1HTSZsAoCYJvkyRxnLXxQWZ7BANHzRT
	cU87Zh7gNEpSHqUE8LB3WJau0OAsdox285NC8dsheqkDtplJ1vEmomi7WkqXdi2lPBL8KLsifcW
	d/xwBPZ9QtxzEmvNveBmZuhMq3Jn2O0MUlxIHVTQ=
X-Gm-Gg: AYBFou38m6MIy4L5ZtkNHOAlAbcEtauN7LRG1inePF8i8wd+iQoO93VV+KdzyaDl41X
	nGMcLA0Px/Q5AMRAmctAQtu8AXyr2q/OJIQ1unEpoqL8EPUEmEs0gdARforx8o4TrnhvdtjV5Ha
	d7E7lijBL3WIEWvIjv6AflGk6w8d+gV3Q95kMq4Ro3/sNV+lRZAy/2WjgSmoV7dNVz3+Yr74Xtb
	tBxO32TbVgUkgFUJcRiE5fHFNTiXkPzrGJvZjFBXqyJaofJQct5txwhuAMmvg3/+giXIJi0uaXh
	EYeO5SH2O4prH0bqR+9yFJqAcYCv8U8IEujd9JtJ4v8hUTbucNKRPRy+YeXUIBdUL7mH7yoHQHq
	IRa9+9um4lQv0Vwy6dBbk/BnKxZ/lsQFnSG1cefjwUc/3JgZCa7BEbnNiqrtVwlUj8oEA8ydu4z
	glH41MjekLFjA3QKxH67pnAB49wvHz6M1qjIi8eo4H1T3FHMw=
X-Received: by 2002:a17:906:7312:b0:c2e:46d0:b802 with SMTP id
 a640c23a62f3a-c46bde8c7d8mr1100681666b.40.1793110261730; Tue, 27 Oct 2026
 07:11:01 -0700 (PDT)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261027-freesync-plane-reset-time-v1-0-bb43b501faf4@gmail.com>
 <20261027-freesync-plane-reset-time-v1-1-bb43b501faf4@gmail.com> <sashiko-outbox-186669@kernel.org>
In-Reply-To: <sashiko-outbox-186669@kernel.org>
From: David Hughes <davidralphhughes@gmail.com>
Date: Tue, 27 Oct 2026 07:10:50 -0700
X-Gm-Features: AclHuK84VcnEHW0gEAXZMPCvk5KE1zhDcnRTYDp8drZma-PfQxzbTYJcvshBpzg
Message-ID: <CAO0OR0kGAKNHOaPqQu-O3HfnaQ23Zt+8FiEUtO2uVhNpoGkkiQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/amd/display: Keep FreeSync flip timing across
 plane resets
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> Can copying dm_old_plane_state->dc_state->time here in dm_update_plane_st=
ate()
> race with an in-flight non-blocking commit or copy stale flip timestamps?

Yes. The copy in atomic check can read the old DC plane's flip timing
while the previous commit is still waiting on fences or writing it in
copy_surface_update_to_plane(). FreeSync only reads
prev_update_time_in_us, so a stale copy usually costs one frame timed
across two flips, and at worst falls back to the behaviour without this
patch. It is still a data race, though.

v2 moves the copy to amdgpu_dm_commit_planes(), before the preflip.
commit_tail() has already waited for the previous commit there
(drm_atomic_helper_wait_for_dependencies()), so the old plane has been
programmed and nothing else writes it, and the copy doesn't need
dm->dc_lock. I'm building and testing it right now.


On Tue, Oct 27, 2026 at 6:52=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] drm/amd/display: race and stale flip time copy in dm_update_pl=
ane_state()
> --
>
> commit ab38a8475d9a38b0920f07d4b8cd8a1171060e9b
> Author: Davey Hughes <davidralphhughes@gmail.com>
>
> drm/amd/display: Keep FreeSync flip timing across plane resets
>
> This commit preserves the DC plane flip timing across plane resets when t=
he
> plane remains on the same CRTC, preventing FreeSync below-the-range (BTR)=
 or
> fixed-refresh paths from seeing a zeroed flip history on color management
> updates.
>
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/driver=
s/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > index bdabb4bf14dab..a69e28685857f 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > @@ -6076,6 +6076,11 @@ dm_update_plane_state(struct dc *dc,
> >                       goto out;
> >               }
> >
> > +             /* FreeSync times each frame from the plane's previous fl=
ip. */
> > +             if (dm_old_plane_state->dc_state &&
> > +                 old_plane_crtc =3D=3D new_plane_crtc)
> > +                     dc_new_plane_state->time =3D dm_old_plane_state->=
dc_state->time;
>
> [Severity: Medium]
> Can copying dm_old_plane_state->dc_state->time here in dm_update_plane_st=
ate()
> race with an in-flight non-blocking commit or copy stale flip timestamps?
>
> When userspace submits a non-blocking commit (Commit 1),
> drm_atomic_helper_swap_state() installs Commit 1's plane state into
> plane->state and queues commit_work before dropping drm_modeset_locks.
>
> Commit 1's worker then runs asynchronously without holding drm_modeset_lo=
cks:
>
>   amdgpu_dm_atomic_commit_tail()
>     -> amdgpu_dm_commit_planes()
>       -> drm_atomic_helper_wait_for_fences()
>       -> mutex_lock(&dm->dc_lock)
>       -> update_planes_and_stream_adapter()
>         -> dc_update_planes_and_stream()
>           -> update_planes_and_stream_state()
>             -> copy_surface_update_to_plane()
>
> In drivers/gpu/drm/amd/display/dc/core/dc.c:copy_surface_update_to_plane(=
),
> DC mutates surface->time under dm->dc_lock:
>
>         surface->time.time_elapsed_in_us[surface->time.index] =3D
>                 (unsigned int)(srf_update->flip_addr->flip_timestamp_in_u=
s -
>                         surface->time.prev_update_time_in_us);
>         surface->time.prev_update_time_in_us =3D
>                 (unsigned int)srf_update->flip_addr->flip_timestamp_in_us=
;
>         surface->time.index++;
>         if (surface->time.index >=3D DC_PLANE_UPDATE_TIMES_MAX)
>                 surface->time.index =3D 0;
>
> If a second commit (Commit 2) that resets the plane enters
> amdgpu_dm_atomic_check() while Commit 1's commit_work is still waiting on
> fences or executing copy_surface_update_to_plane(), amdgpu_dm_atomic_chec=
k()
> calls dm_update_plane_state() before calling do_aquire_global_lock():
>
>   amdgpu_dm_atomic_check() {
>       ...
>       for_each_oldnew_plane_in_descending_zpos(...) {
>           ret =3D dm_update_plane_state(dc, state, plane,
>                                       old_plane_state,
>                                       new_plane_state,
>                                       true,
>                                       &needs_dc_state_realloc,
>                                       &is_top_most_overlay);
>           ...
>       }
>       ...
>       if (needs_dc_state_realloc) {
>           ...
>           ret =3D do_aquire_global_lock(dev, state);
>       }
>   }
>
> Because dm_update_plane_state() reads dm_old_plane_state->dc_state->time
> without holding dm->dc_lock and before do_aquire_global_lock() waits for
> Commit 1's hw_done and flip_done:
>
> 1. If Commit 1 is currently in copy_surface_update_to_plane(), the unlock=
ed
>    struct assignment races with the writes to surface->time.
> 2. If Commit 1 is still waiting on fences before acquiring dm->dc_lock,
>    dm_update_plane_state() snapshots the pre-Commit-1 flip time (which is=
 all
>    zeroes if Commit 1 also reset or enabled the plane, or Commit 0's time=
stamp
>    otherwise). Then do_aquire_global_lock() blocks until Commit 1 finishe=
s
>    updating dm_old_plane_state->dc_state->time and signals flip_done, all=
owing
>    even a non-blocking Commit 2 to pass stall_checks() in
>    drm_atomic_helper_setup_commit() and commit with the stale dc_new_plan=
e_state->time.
>
> Would it be safer to copy or update the flip timing in commit_tail (for
> example inside amdgpu_dm_commit_planes() under dm->dc_lock after the prev=
ious
> commit has completed), or after synchronizing with the previous commit?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261027-freesync=
-plane-reset-time-v1-0-bb43b501faf4@gmail.com?part=3D1
