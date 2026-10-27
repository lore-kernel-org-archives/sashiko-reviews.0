Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793105210;
	b=wg7ncLNpBQgQ7+eE5UEaSFsOYeHJJhHZDD1U7vE160q2IeU39ocKrgkeEkZ41wbahxw7
	 j5OtJdttI7HNU8yi9nzeHXd2kCmk0g7jHisXwbEbjePRVbE5Uf4h4L8poNfdrYVKVrYiB
	 YOATsvH9zdO6FHqb0UT22b0lidGolv5qN5NnW8Hd/vMeI88vIednFrouscobHUTPubgV1
	 7Q6z9enujGtkg7z0MTTRhWb0GD+O438T1jFuOY258PSI+/C4F0QB2eSybyQ6ahPU/We/C
	 EaKX3xrdpekzwIn0m1iXiafFGTA7jpWt+b6oV+HDZtFDgpcDooCsKIb1ceQvyLfLA/Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793105210;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=tM9z4Y/40xyWfahMedWVRhKTHJQqTvitq9arJ2Ee7fw=;
	b=1PvV8Eu+oD6aJhqYkq0jT2PETdUH6sclLG6KILZlnUehfXropGp1F2SceygSYhdD7Yup
	 d2f0cpQshYaWb78uNjTD3xnhg8shfHFTIhOHNwVq9ffgyAcTSwFxn3Q+/bwg5RIGzBnrM
	 zHcnIWG/+lA2mYQ4oonI7moFMz3BJtJTtI0aGe9AMoHw3W7mBkMKL9UAviEwmNOSog9gN
	 plnfbz+iR9Q4GpAaLWUoY7NhGmS7Y9x5lyZSm5xBirXm4Cbq/iRJKfZ25Wfyis2rB9enm
	 yUo3rgLnUSfs+dANYSTvis7h1yOJnaGDUOw52hAyZ2OFPDisniz9fnfB2VDX/5JvY0A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=clyso.com;
	spf=pass smtp.mailfrom=clyso.com;
	dkim=pass header.d=clyso.com header.i=@clyso.com header.a=rsa-sha256 header.s=google header.b=PErLynsC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B7E606A31D
	for <sashiko-reviews@lists.linux.dev>; Tue, 27 Oct 2026 12:46:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54B7E606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=clyso.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=clyso.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=clyso.com header.i=@clyso.com header.a=rsa-sha256 header.s=google header.b=PErLynsC
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c43373ae89aso621221266b.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 27 Oct 2026 05:46:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793105208; cv=none;
        d=google.com; s=arc-20260327;
        b=poEt8FGgNxU7yYF1Sy0bRkiDX313xygGrqiIpE8xOadsWS1Ckx9fanSMb+xNoyKq0m
         4ABZy7fS5UxGf2wIx+VZWLHDrzvJGAjpgP38lxMk71ZOgeBfdPnXG22PZDR34Th4SgR2
         ZmW4ws591V8N1VjKTg3tycilAZC5ZqrH4EZo+L5lDDHAgUFQvD9g+Yt5nsZM/Sw1bqkc
         XmPFwRGYyTGJRQnKKt7j9x/QuqKM5u4lP5NXWEyAnNoU6arkhc//BeiCg7ohHfm/JOF3
         G1Trdmlu99is4etcdTCcJmSJ8hPWrBqC/9OVaFhPI101i1E5hX3p+pD0rTUd73MNX8pL
         Ntkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tM9z4Y/40xyWfahMedWVRhKTHJQqTvitq9arJ2Ee7fw=;
        fh=dmBZ55l7R4Io+TVPNriqefzzvAgQ+YK1Wy+g6L/BB8Q=;
        b=W+WT0VeEHSsFH/VgTlka9/6nGnlGcqPsLlJ9zfKRbS5QnDkiUOgOj+z9im9lsFNY7r
         K+WL0yY6WJwIHcfNiAeifRpHwpp+LX6XpyVpUxoCwTpxIwMlW7x1MWNQIKte2I/B87rs
         vuXQgCLLUWi1wi00JftPR3wQ98GbxclAt1OBYqqhbX2O5b/4kCs54D3bRg3fICmmk+v4
         eYrus+bMEvA3/0ELYSZzQ1n7DGfBwOMO4l1vtR8r9i/KWkr35OCeGbmawgoUk9rScfT+
         owMLjniF75Bbaxxat5yHWiThtbFkSWMV+uffaXCXFRs/L6vQWMS2woJgzCb/+omAUGIs
         vKbQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=clyso.com; s=google; t=1793105208; x=1793710008; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tM9z4Y/40xyWfahMedWVRhKTHJQqTvitq9arJ2Ee7fw=;
        b=PErLynsCpS8Jin7uV1CW1cdy1etdkV9BvH6m/b+ImgA3UCU5HawdLWblOTy8H+og52
         U1TpPAXO0bqxgmRwKhjTCyXgLcinmvfxBnTfMROEJdiFmohXYDZMG7b+IQ+ulKNDopyT
         oaDwv2yxlxkJMHoBmrMfMoTUSDHSoQJFoHzERfn8LduL+fcZY7JzzWZIVGcs6vKdGdua
         TyhDT7KE615EWMbB7Xo2Il3cK0qWoe7tOskQ+MEkn9t2yLlu1NuS8Wgr6GKOWtGIfjuy
         2NI6NXKCW9jmcsIUbIV1TAhgg3jYo9J99TQb9DYWJ2s9sTCSUreVL6U2qgccfSGTVZIi
         1AxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793105208; x=1793710008;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tM9z4Y/40xyWfahMedWVRhKTHJQqTvitq9arJ2Ee7fw=;
        b=iMoAi4WcIHWRnbvLQ50lXMeW/z0a7RO026WmZHrPhHE7WWhucUSCc+lNIzH3jZvlP9
         ejDQoOAKe53Oeztx/ii/l1NzB9mtmy62jJqKZM2pqJUx5R+wPW8Q54Us5j5kMKIzOv4E
         8btILM0t6LUVAZcuU2/bZGfTMFssiYY/QMfU9vbJCiD8oFsbZR3395SDv7m52xj91SRf
         7lNNR403HZGqWMaltp+OTblN+L+61qfBurymoZeDWETal5eCZ815E322jINC8ZJu4rGe
         +GWehHZN053N/ayZ0Tn5YEBWnHe+deXD16PQ1H2X+oCNZ3bxfSzz8VOUxZ9APHJLMXE7
         sS1w==
X-Gm-Message-State: AFq9FYIuaqmYxcT0/Pc+O6NYUskxw9HmiDjLezJTV6TtBFohOB2BGi+Q
	l12Y64urVMaUf/ixKCCssxecV1TphI4QnMDqsuVZh5zUrtz7XoP6XtnygjudEnz5lbo3MIPUi8i
	Au1hnslotkLuRSgerts2Oq77ZW2i1Z2b+aPKr2HXoG3RqC41ODiSe/cl8Ag==
X-Gm-Gg: AYBFou3q29MvqWoGVY6dTs8/9/it+ixsex2yYhaZ0TJ6RSzrjSIRZowuX6SwJoR+avi
	oCxldYKz7yLQ9iIhlzsfDfD+2u3h17xUCiCuAHroB42z5NH+0KbeanhN08XpwFWK4Cm6eh+Nc1r
	KNUapTo4qAGiKuupqt6S4VHniPdOPitZtMIy3QlTVyEZIgnN7xjI9VSnjtSYpGHHqf/8H49dsBZ
	277FPfzTR9mXyRsi9qxulMsQx9vGePOKa2a8Kq9Gi89X39QEsPc2MygyT/XOkr+auAP6y02JC8N
	XvTdlbnqluboRCpWqHPPUDvP4wv08qjPzci2Xc39/GjkaRZ8KCGCf+6h2cUfkDYzSLOAo8W/AAW
	5qwlFxbKXRI2J6yhbILjOkrHqG39wTuQdd56p4Aa7FNB7oQo6VYQ+RWLpawW8
X-Received: by 2002:a17:907:86a5:b0:c29:f5d5:5a9c with SMTP id
 a640c23a62f3a-c46bde938ebmr1066468966b.38.1793105208250; Tue, 27 Oct 2026
 05:46:48 -0700 (PDT)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <cover.20261025T182649Z.ca9ae7a18449.git.amarkuze@redhat.com>
 <1b6167c472fe05e2cd650bde2ffc9421892ad4cc.20261025T182649Z.ca9ae7a18449.git.amarkuze@redhat.com>
 <sashiko-outbox-184356@kernel.org>
In-Reply-To: <sashiko-outbox-184356@kernel.org>
From: Xiubo Li <xiubo.li@clyso.com>
Date: Tue, 27 Oct 2026 13:45:27 +0100
X-Gm-Features: AclHuK-sYpg2h3MTlNgp-i_UZSC8bHA1yVOe6oLZ66x7r66CL4rBT9LPbMbxzKQ
Message-ID: <CAOJNxR+6M7MLXOD5o-sd6uXMqp1AFwZJj2oNvVv7GW4Axoeb=g@mail.gmail.com>
Subject: Re: [PATCH v6 4/5] ceph: record subvolume quarantine from MDS cap updates
To: sashiko-reviews@lists.linux.dev
Cc: Alex Markuze <amarkuze@redhat.com>, idryomov@gmail.com, slava@dubeyko.com, 
	viro@zeniv.linux.org.uk, brauner@kernel.org, jack@suse.cz, 
	linux-fscrypt@vger.kernel.org, ebiggers@kernel.org, tytso@mit.edu, 
	jaegeuk@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alex,

> +void ceph_handle_quarantine_disable(struct ceph_mds_client *mdsc,
> +     struct ceph_mds_session *session,
> +     struct ceph_msg *msg)
> +{
[...]
> + if (msg->front.iov_len < sizeof(*h)) {
[...]
> + vino.ino =3D le64_to_cpu(h->ino);
> + vino.snap =3D CEPH_NOSNAP;
> + inode =3D ceph_find_inode(sb, vino);

The message is never validated beyond its length:

  - h->oserrno is ignored;
  - msg->hdr.version is never checked, and MQuarantineDisable is
    versioned (HEAD_VERSION 1).

A future v2 with a different layout, or a disable that carries an
error, would clear the mark all the same.  Please reject unknown
versions and act only on oserrno =3D=3D 0.

> +static bool ceph_quarantine_reply_can_clear(struct ceph_inode_info *ci,
> +     struct ceph_mds_session *session)
> +{
[...]
> + req =3D ceph_current_mds_request(mdsc->fsc);
> + epoch =3D (u64)atomic64_read_acquire(&mdsc->quarantine_epoch);
> + return req && !(epoch & 1) && req->r_quarantine_epoch =3D=3D epoch &&
> + !atomic_read(&mdsc->quarantine_splices);

r_quarantine_epoch is compared against the mount-wide epoch, which every
splice on the mount moves.  In ceph_readdir_prepopulate(), splice_dentry()
for entry N runs before ceph_fill_inode() for entry N+1, so a readdir
reply invalidates itself after its first entry.  From then on the reply
can never clear a mark from another rank.  This is sashiko's point; I
agree with it.

Comparing against a snapshot taken when this reply started filling, or
counting only splices from other tasks, would avoid the self-invalidation.

> + ceph_quarantine_splice_start(parent->i_sb);
[...]
> + ceph_quarantine_move_start(moved, old_dir, new_dir);

5/5 changes both signatures again (struct ceph_quarantine_splice and
the owner list).  Please introduce the final API here, so 5/5 does not
have to rewrite every caller.

Thanks,
Xiubo

On Sun, 25 Oct 2026 at 20:12, <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [High] ceph: epoch self-invalidation in ceph_quarantine_reply_can_clear=
()
> - [High] ceph: __ceph_remove_cap() resets quarantine mark during cap migr=
ation
> --
>
> commit 8a2e69935d967838e52792bb963b124cfe229b88
> Author: Alex Markuze <amarkuze@redhat.com>
>
> ceph: record subvolume quarantine from MDS cap updates
>
> This commit decodes the signed oserrno from MClientCaps v14 messages to
> record a sticky subvolume quarantine mark and reporting MDS rank on each
> inode, along with epoch-based caching and RCU parent walks to resolve
> inherited quarantine state.
>
> > diff --git a/fs/ceph/caps.c b/fs/ceph/caps.c
> > index b27bcdc24d29f..b07814d0038cd 100644
> > --- a/fs/ceph/caps.c
> > +++ b/fs/ceph/caps.c
>
> [ ... ]
>
> > @@ -1264,6 +1265,11 @@ static void __ceph_remove_cap(struct ceph_inode_=
info *ci, struct ceph_cap *cap,
> >
> >       mdsc =3D ceph_inode_to_fs_client(&ci->netfs.inode)->mdsc;
> >
> > +     /* Losing the reporting cap requires fresh MDS revalidation. */
> > +     if (READ_ONCE(ci->i_qtine_mds) =3D=3D cap->mds &&
> > +         ceph_quarantine_reset(ci))
> > +             wake_up_all(&ci->i_cap_wq);
> > +
> >       /* remove from inode's cap rbtree, and clear auth cap */
> >       rb_erase(&cap->ci_node, &ci->i_caps);
> >       if (ci->i_auth_cap =3D=3D cap)
> > @@ -3729,6 +3735,9 @@ struct cap_extra_info {
> >       u8 *fscrypt_auth;
> >       u32 fscrypt_auth_len;
> >       u64 fscrypt_file_size;
> > +     /* MClientCaps v14 oserrno; valid only when oserrno_valid is set =
*/
> > +     s32 oserrno;
> > +     bool oserrno_valid;
> >  };
> >
> >  /*
> > @@ -3757,6 +3766,46 @@ static int parse_inline_data(void **p, void *end=
,
> >       return -EIO;
> >  }
> >
> > +/*
> > + * Record quarantine state carried by an MClientCaps oserrno.
> > + * Caller holds i_ceph_lock. Returns true when waiters should be woken
> > + * because quarantine changed or a pending reset was resolved.
> > + *
> > + * -EQUARANTINED refreshes the sticky flag and its reporting MDS rank.
> > + * A current non-IMPORT grant above PIN with errno 0 clears that rank'=
s mark.
> > + * IMPORT may carry a default zero without assessing quarantine permis=
sion.
> > + * Another rank needs a successful metadata request for the current ep=
och.
> > + * A PIN-only update may zero qtine_errno while leaving the flag set.
> > + */
> > +static bool ceph_apply_quarantine(struct ceph_inode_info *ci, int mds,
> > +                               int newcaps, int oserrno, bool is_impor=
t)
> > +{
> > +     bool was, now, pending;
> > +
> > +     was =3D READ_ONCE(ci->i_qtine_errno) =3D=3D -CEPH_EQUARANTINED ||
> > +           test_bit(CEPH_I_QUARANTINE_BIT, &ci->i_ceph_flags);
> > +     pending =3D test_bit(CEPH_I_QUARANTINE_PENDING_BIT, &ci->i_ceph_f=
lags);
> > +
> > +     if (!is_import && (newcaps & ~CEPH_CAP_PIN) && was && oserrno =3D=
=3D 0 &&
> > +         READ_ONCE(ci->i_qtine_mds) =3D=3D mds)
> > +             ceph_quarantine_clear(ci);
> > +
> > +     if (oserrno =3D=3D -CEPH_EQUARANTINED) {
> > +             ceph_quarantine_set(ci);
> > +             WRITE_ONCE(ci->i_qtine_mds, mds);
> > +     }
>
> [Severity: High]
> When a quarantined inode's capability is migrated between MDS ranks via
> handle_cap_export() or handle_cap_import(), removing the exporting rank's
> cap calls ceph_remove_cap() -> __ceph_remove_cap(), which sees
> ci->i_qtine_mds =3D=3D cap->mds and calls ceph_quarantine_reset(ci).
>
> When handle_cap_grant() then processes the CEPH_CAP_OP_IMPORT message fro=
m
> the new authoritative rank with the default oserrno =3D=3D 0,
> ceph_apply_quarantine() leaves CEPH_I_QUARANTINE_PENDING_BIT set and keep=
s
> ci->i_qtine_mds set to the old exporting rank.
>
> As a result:
> 1. ceph_inode_quarantine_direct() returns false and
>    ceph_quarantine_walk_once() breaks out with CEPH_QWALK_INCOMPLETE inst=
ead
>    of reporting the retained quarantine mark as CEPH_Q_UNDER.
> 2. Subsequent normal CEPH_CAP_OP_GRANT messages (above CEPH_CAP_PIN with
>    oserrno =3D=3D 0) and CEPH_MSG_CLIENT_QUARANTINE_DISABLE messages from=
 the
>    new authoritative rank cannot clear the mark in ceph_apply_quarantine(=
)
>    or ceph_handle_quarantine_disable() because ci->i_qtine_mds still hold=
s
>    the pre-migration rank.
>
> Should capability migration preserve the active mark and transfer
> ci->i_qtine_mds to the importing rank instead of resetting the mark to
> pending when the old rank's cap is removed?
>
> [ ... ]
>
> > diff --git a/fs/ceph/inode.c b/fs/ceph/inode.c
> > index 94f5215f8eed5..048e0d502eb4e 100644
> > --- a/fs/ceph/inode.c
> > +++ b/fs/ceph/inode.c
>
> [ ... ]
>
> > +static bool ceph_quarantine_reply_can_clear(struct ceph_inode_info *ci=
,
> > +                                         struct ceph_mds_session *sess=
ion)
> > +{
> > +     struct ceph_mds_client *mdsc =3D ceph_sb_to_mdsc(ci->netfs.inode.=
i_sb);
> > +     struct ceph_mds_request *req;
> > +     u64 epoch;
> > +
> > +     if (READ_ONCE(ci->i_qtine_mds) =3D=3D session->s_mds)
> > +             return true;
> > +     /* Different ranks have independent cap sequences. */
> > +     req =3D ceph_current_mds_request(mdsc->fsc);
> > +     epoch =3D (u64)atomic64_read_acquire(&mdsc->quarantine_epoch);
> > +     return req && !(epoch & 1) && req->r_quarantine_epoch =3D=3D epoc=
h &&
> > +             !atomic_read(&mdsc->quarantine_splices);
> > +}
>
> [ ... ]
>
> > @@ -1407,7 +1873,7 @@ int ceph_fill_inode(struct inode *inode, struct f=
olio *locked_folio,
> >       /* were we issued a capability? */
> >       if (info_caps) {
> >               if (!ceph_in_snap(inode)) {
> > -                     ceph_add_cap(inode, session,
> > +                     bool cap_current =3D ceph_add_cap(inode, session,
> >                                    le64_to_cpu(info->cap.cap_id),
> >                                    info_caps,
> >                                    le32_to_cpu(info->cap.wanted),
> > @@ -1416,6 +1882,14 @@ int ceph_fill_inode(struct inode *inode, struct =
folio *locked_folio,
> >                                    le64_to_cpu(info->cap.realm),
> >                                    info->cap.flags, &new_cap);
> >
> > +                     /*
> > +                      * Caps above PIN mean quarantine has been lifted=
,
> > +                      * including when the disable message was lost.
> > +                      */
> > +                     if (cap_current && (info_caps & ~CEPH_CAP_PIN) &&
> > +                         ceph_quarantine_reply_can_clear(ci, session))
> > +                             ceph_quarantine_clear(ci);
>
> [Severity: High]
> Can ceph_quarantine_reply_can_clear() fail to clear quarantine on target
> inodes and readdir entries when the reply comes from a rank different fro=
m
> ci->i_qtine_mds because reply processing itself increments
> mdsc->quarantine_epoch?
>
> req->r_quarantine_epoch is sampled once in ceph_mdsc_create_request() and
> never updated:
>
>   req->r_quarantine_epoch =3D atomic64_read_acquire(&mdsc->quarantine_epo=
ch);
>
> During reply handling, ceph_fill_trace() processes parent_dir before
> req->r_target_inode:
>
>   ceph_fill_trace()
>     if (parent_dir)
>       ceph_fill_inode(parent_dir, ...)
>         ceph_quarantine_clear(ci) -> advances mdsc->quarantine_epoch by 2
>     ...
>     if (rinfo->head->is_target)
>       ceph_fill_inode(in, ...)
>         ceph_quarantine_reply_can_clear(ci, session)
>
> If both parent_dir and req->r_target_inode had CEPH_I_QUARANTINE_BIT set =
on
> another rank, clearing parent_dir increments mdsc->quarantine_epoch by 2.
> When ceph_fill_inode() then runs for req->r_target_inode,
> req->r_quarantine_epoch =3D=3D epoch is false, leaving the target inode's
> quarantine mark set.
>
> The same self-invalidation happens in handle_reply() ->
> ceph_readdir_prepopulate(), where each entry in the loop calls
> ceph_fill_inode() and splice_dentry() (which calls
> ceph_quarantine_splice_start() and ceph_quarantine_splice_finish(),
> advancing mdsc->quarantine_epoch by 4), preventing
> ceph_quarantine_reply_can_clear() from succeeding on subsequent entries i=
n
> the same readdir reply.
>
> In addition, any unrelated dentry splice or cross-directory rename on the
> superblock while the MDS request is in flight (or sampling an odd
> mdsc->quarantine_epoch in ceph_mdsc_create_request()) will cause
> req->r_quarantine_epoch =3D=3D epoch to fail even when no new quarantine =
mark was
> set.
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.20261025T18=
2649Z.ca9ae7a18449.git.amarkuze@redhat.com?part=3D4
