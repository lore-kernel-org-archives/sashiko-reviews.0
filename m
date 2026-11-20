Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795197267;
	b=CZxWak2yAvVsTpfFI8tIOvUnuKlkySTVfiuUFUFa6KG91g3h38ZDmdm/OhQ/SnuYM2H+
	 LO7IqPQn+wPze8QRnvgNMsM3FfHDX8OEyeID6/55Lant98RgNyCsVpW9ZbdZC0z1iAVLm
	 oKogWRXJKWPnYCwOg0st9wHWdiY6o8mBDFatd01A8nF9qX6W2yVDVBTB6Gw2c+V9UlXFG
	 3Akxn2a4kWdRksKA1HyCLxGwHiJbsnJ99X2Dr/Vj6L3pnD2Ba7vrxg+L0LpdaEFed7TXm
	 oS/oLE1h/JLGXZiZuq0p3PVck40/ud4ZWFQO9x9C9C2ZsSSOIfQSjaCoSFPokiIcJAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795197267;
	h=Received:DKIM-Signature:Message-ID:Subject:From:To:Cc:Date:
	 In-Reply-To:References:Autocrypt:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=zY0Pi8dwjcWc2XgkvHosdTVcfeD+I5hCUN07rznUhdg=;
	b=3KYvSzI8vNr/SHsRRSHg1XCLts2zwwNRKgLrUZA4OPTbDEGEJQTIr2KdJWt71h6+Saod
	 Y83Cb4e4jJU16VyKRUNeDuuFRZ8FWgatdyVbtOzLTLJFS8+TPDehk/J6cIq6DXFemZkJc
	 HlPU4uoMG77+41qWa5blfI19frdYErTwO256vL+VCPKrYz+ols3Izq3ksyYRDkCMbsGNA
	 HyFOfaIvsiW2Z1DqZJhdqsmUwvC6F+52Rbf/SZ/WwOw77yVOz68kh9+Yb1g3eR6x66Gwy
	 U7E7bhmucKY/XeBCD6xUuDMnIcIPIlYFaZP5iVlKwIY0Y8FL7wuaPf3gEmAhV/TRknQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gc3GTCd7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DAE760A3818
	for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 17:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gc3GTCd7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90BA11F000C6;
	Fri, 20 Nov 2026 17:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795197266;
	bh=zY0Pi8dwjcWc2XgkvHosdTVcfeD+I5hCUN07rznUhdg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=gc3GTCd7kBjje4hG0Kv2OnxMja+Gizh8hqoTcx1msurJ+wEpZEWauYpJYWmCydyL6
	 DDSz0VpxVcSxLOUkHz+qnFMXg6vzni+eadB91Z7A/M5EytwPdlDd/W5WsgkdkEU/CG
	 Y/UTTvysRIFrl6PweIqz2xeBCNYDin1kqN7uY1Bq5Yl1pFEI8oH3EO4pF65HDkxgF8
	 JvIIr6JCPikgiApTCeMni0ZUCGcAWhsXvRrrN3nQv5EqDVX8ojWnnBZhfzYeg3GmuF
	 EMJXAJ7qH/frgKDuaj5YcLNIyfjYmb5OWw7h0qaxqJmKZrwdKJG7sGQck11eSJe87w
	 RJg5xZqvPBRFQ==
Message-ID: <13767698c1fe20c909215cec8388c4db5fc0ca4c.camel@kernel.org>
Subject: Re: [PATCH 08/11] nfsd: apply delegated times in a separate
 times-only setattr
From: Jeff Layton <jlayton@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Chuck Lever <cel@kernel.org>, Anna Schumaker <anna@kernel.org>
Date: Fri, 20 Nov 2026 09:54:26 -0800
In-Reply-To: <sashiko-outbox-225625@kernel.org>
References: <20261120-delegts-fixes-v1-0-c89b37d2d462@kernel.org>
	 <20261120-delegts-fixes-v1-8-c89b37d2d462@kernel.org>
	 <sashiko-outbox-225625@kernel.org>
Autocrypt: addr=jlayton@kernel.org; prefer-encrypt=mutual;
 keydata=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
 QZIQXVeAA+smfTT0tDrisj1U5x6ZB9b3nBg65kc=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-3.fc44) 
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

On Fri, 2026-11-20 at 17:08 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] nfsd: inaccurate dl_setattr tracking in
>   nfsd4_deleg_set_times()
> --
>=20
> commit 52dc07bb2ea3b8d66b511cb734482beaf6e291eb
> Author: Jeff Layton <jlayton@kernel.org>
>=20
> nfsd: apply delegated times in a separate times-only setattr
>=20
> This commit decodes delegated access and modify timestamps into dedicated
> fields in struct nfsd4_setattr and applies them after nfsd_setattr() via =
a
> separate notify_change() call with ATTR_FORCE.
>=20
> > diff --git a/fs/nfsd/nfs4proc.c b/fs/nfsd/nfs4proc.c
> > index 71d6a473c1bc8..ae6ee42d169a7 100644
> > --- a/fs/nfsd/nfs4proc.c
> > +++ b/fs/nfsd/nfs4proc.c
> > @@ -1361,33 +1361,58 @@ nfsd4_secinfo_no_name_release(union nfsd4_op_u =
*u)
> >  		exp_put(u->secinfo_no_name.sin_exp);
> >  }
> > =20
> > +#define NFSD4_DELEG_TIME_BITS	(FATTR4_WORD2_TIME_DELEG_ACCESS | \
> > +				 FATTR4_WORD2_TIME_DELEG_MODIFY)
> > +
> >  /*
> > - * Validate that the requested timestamps are within the acceptable ra=
nge. If
> > - * timestamp appears to be in the future, then it will be clamped to
> > - * current_time().
> > + * Apply a delegation holder's times in a times-only setattr. The stat=
eid,
> > + * not file ownership, grants the authority to set them, hence ATTR_FO=
RCE.
> > + * ATTR_DELEG isn't needed: nfsd_breaker_owns_lease() keeps the holder=
's
> > + * own lease intact, and any other lease is broken.
> >   */
> > -static void
> > -vet_deleg_attrs(struct nfsd4_setattr *setattr, struct nfs4_delegation =
*dp)
> > +static __be32
> > +nfsd4_deleg_set_times(struct svc_rqst *rqstp, struct svc_fh *fhp,
> > +		      struct nfsd4_setattr *setattr, struct nfs4_delegation *dp)
> >  {
> > -	struct timespec64 now =3D current_time(dp->dl_stid.sc_file->fi_inode)=
;
> > -	struct iattr *iattr =3D &setattr->sa_iattr;
> > +	struct iattr iattr =3D { };
> > +	struct timespec64 now;
> > +	struct inode *inode;
> > +	__be32 status;
> > +	int host_err;
> > =20
> > -	if ((setattr->sa_bmval[2] & FATTR4_WORD2_TIME_DELEG_ACCESS) &&
> > -	    !nfsd4_vet_deleg_time(&iattr->ia_atime, &dp->dl_atime, &now))
> > -		iattr->ia_valid &=3D ~(ATTR_ATIME | ATTR_ATIME_SET);
> > +	/* nfsd_setattr() is skipped for a times-only request */
> > +	status =3D fh_verify(rqstp, fhp, 0, NFSD_MAY_SATTR);
> > +	if (status)
> > +		return status;
> > +	inode =3D d_inode(fhp->fh_dentry);
> > =20
> > +	now =3D current_time(inode);
> > +	if (setattr->sa_bmval[2] & FATTR4_WORD2_TIME_DELEG_ACCESS) {
> > +		iattr.ia_atime =3D setattr->sa_deleg_atime;
> > +		if (nfsd4_vet_deleg_time(&iattr.ia_atime, &dp->dl_atime, &now))
> > +			iattr.ia_valid |=3D ATTR_ATIME | ATTR_ATIME_SET;
> > +	}
> >  	if (setattr->sa_bmval[2] & FATTR4_WORD2_TIME_DELEG_MODIFY) {
> > -		if (nfsd4_vet_deleg_time(&iattr->ia_mtime, &dp->dl_mtime, &now)) {
> > -			iattr->ia_ctime =3D iattr->ia_mtime;
> > -			if (nfsd4_vet_deleg_time(&iattr->ia_ctime, &dp->dl_ctime, &now))
> > +		iattr.ia_mtime =3D setattr->sa_deleg_mtime;
> > +		if (nfsd4_vet_deleg_time(&iattr.ia_mtime, &dp->dl_mtime, &now)) {
> > +			iattr.ia_valid |=3D ATTR_MTIME | ATTR_MTIME_SET | ATTR_CTIME;
> > +			iattr.ia_ctime =3D iattr.ia_mtime;
> > +			if (nfsd4_vet_deleg_time(&iattr.ia_ctime, &dp->dl_ctime, &now)) {
> > +				iattr.ia_valid |=3D ATTR_CTIME_SET;
> >  				dp->dl_setattr =3D true;
> > -			else
> > -				iattr->ia_valid &=3D ~(ATTR_CTIME | ATTR_CTIME_SET);
> > -		} else {
> > -			iattr->ia_valid &=3D ~(ATTR_CTIME | ATTR_CTIME_SET |
> > -					     ATTR_MTIME | ATTR_MTIME_SET);
> > +			}
> >  		}
> >  	}
> > +	if (!iattr.ia_valid)
> > +		return nfs_ok;
> > +
> > +	iattr.ia_valid |=3D ATTR_FORCE;
> > +	inode_lock(inode);
> > +	host_err =3D notify_change(&nop_mnt_idmap, fhp->fh_dentry, &iattr, NU=
LL);
> > +	inode_unlock(inode);
> > +	if (!host_err)
> > +		host_err =3D commit_metadata(fhp);
> > +	return nfserrno(host_err);
> >  }
>=20
> [Severity: Medium]
> Should dp->dl_setattr be set whenever ia_mtime passes vetting, and only
> after notify_change() succeeds?
>=20
> With this change, when sa_deleg_mtime passes vetting against dp->dl_mtime
> but fails against dp->dl_ctime (dl_mtime < sa_deleg_mtime <=3D dl_ctime),
> notify_change() still applies the vetted mtime and updates ctime to the
> current time via ATTR_CTIME, yet dp->dl_setattr remains false.  When the
> delegation is later returned, nfsd4_finalize_deleg_timestamps() sees
> !dp->dl_setattr and overwrites the client's vetted mtime (and atime) with
> the server's current time:
>=20
> fs/nfsd/nfs4state.c:nfsd4_finalize_deleg_timestamps() {
> 	...
> 	if (dp->dl_setattr)
> 		return;
> 	...
> 	ret =3D __nfsd_update_cmtime_attr(f, ATTR_ATIME);
> }
>=20
> Conversely, setting dp->dl_setattr =3D true before notify_change() runs
> leaves it set if notify_change() fails, causing
> nfsd4_finalize_deleg_timestamps() to skip updating mtime and ctime on
> delegation return.

The mtime-only case is intentional (see e5e9b24ab8fa): dl_setattr is
only set for a delegated mtime that is also a valid ctime; one that
doesn't post-date the ctime seen at grant time is clock skew, so we
restamp on return. Agreed on the ordering, though that predates this
patch too; v2 sets dl_setattr only after notify_change() succeeds.
--=20
Jeff Layton <jlayton@kernel.org>
