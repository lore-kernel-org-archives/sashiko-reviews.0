Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C942F7EE4
	for <sashiko-reviews@lists.linux.dev>; Fri,  5 Jun 2026 15:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780673611; cv=none; b=KDBwp97cabWFpX9Nh9A6hJhjzKBay9fdzffNBZl8x3mJq6EmR2Z+YQqPXRq4coeT2WSDVmRrIn6Cilr0uOLIC2uKOqWLndB/xObTCfNjgHIKnvgkb7TZKneEN0V68GP9iE/JmNbV92UxWn1PizW+yE4SAni7zxoJ1Us93osS9FY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780673611; c=relaxed/simple;
	bh=pe0rmx+cxv9y62/iOkR1NUb7COuXxk0zlNl1qRN4sF4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tkWcFINM5aLpvggJ66W8dNZj5p/s3+68Hl4X9BO2b+gXKyPqBDERkqP1I8n5XlEatP/VQwBILzjSwEDFjDugcPFAyh4CmomLiNuiqecu6xEWGetyyc5mc/2x/uVCytysJCfvV7hZ7JVMgicaQ5wUOK4Q1OCeGHmbYtLftgDocxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sarze8Ca; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sarze8Ca"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62FAB1F00893;
	Fri,  5 Jun 2026 15:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780673608;
	bh=Mbdmq4Leb+ZwNWt2t0EiTXdInl4X5ELk6gS+BDi40i8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Sarze8CaQXIeUh0LxG+LNjaZOAkFNtKMtCGAUXKYWRLQog2MHPBW3mcMuD6wzHjAx
	 GKBmtxTTlomZ8JP74z6t+PolFKlpVyxSz2w6ELKxn98iYspxRD409Q55yJGD+hQdqM
	 SL38P2cYSM4uaidBYzOoWY5kwpCEmMTpI0etpt+4gCIB+huwE6aWdBkOwYpYDJ61AS
	 km+JqK0FApRGa56+1n9iAlrNmWw4FUk/FA/4T4wW8lf545QIz1Z2wlbAXLVNWSeDHO
	 6V2qpjEnM1bIO0BGu7lFUPiYOruwGuTEvyNVOkiPI+sRYfsU7g2U82Uugc3kMFJT4z
	 Heik13egUPbew==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 9922DF4006F;
	Fri,  5 Jun 2026 11:33:27 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Fri, 05 Jun 2026 11:33:27 -0400
X-ME-Sender: <xms:R-wiag_yggALpQ_A3CEUcnpnnZIdWF84d_9K86fZpaYuXJ5uKCZbPQ>
    <xme:R-wiajqpPpSJ5tlj8qN9Ml9aiKLQ3vvbaolr3hjPTSsBEolHogb4WF1El6g0ZQPZG
    qhihsY6MxHIqJZmML48ZX0VGL_-trCIH-w16xo740KHBXlylgoiNRs>
X-ME-Received: <xmr:R-wialCgOMZeCMpQfi7Y3flj7cDHYl3v3ISRNyNmGGpyiUwVQK8G1Gwyy7s>
X-ME-Proxy-Cause: dmFkZTE5q7wspRguf/xfzLeVi3MIs2Gj4EfIHTkUc1lLAmhybEywZyWFPuPAchSTPk302j
    5qa7Ta75/FfpsA9ph/y6zR8dOlipoy2NsJryeCv/cMr+KRmiWbN5BTDzMY09PKgPw6Q8/S
    JOrNBMYEwaRZaQQpqEbygfvD4EKweAd1f/LEWcRkUNU2kx6mYNxsjy1On2KzKqsLciVQGU
    BpN5qsnQnZ09Sg8h+Ite1nVQy3obAfWhBuTG1G+oW38s2TVFq31W9GKGBj7Wah+ndwXE7Q
    QqsDM+FN9gCvCmAM8OijbjxYVINJ7C121xS0f50lXW82d75diCF5OdbN1WyWapAyFjgblL
    brlJoA0MM1gvpmGP3KPxPVpJRj6PLnoZyPyzS09TqOKWpLmgYjhUJfLcKomC+L3pAq+RV1
    gs2zfu2UwvnVrLTwJxCGGo0/z/Bp68InsXjq7MXUx9UdhxdvB6vWOXdAiezHG2Qr2HbUmk
    EWQyAwszmoBUUTayyLTi12jUIVK3wd5uasMtHv2bYL+7+No3nez6Gn6Wiy4NjrwxNQChvE
    2MkrosLDTsbe1qHXAb/YZN53ElTwbVaczqkhjEV/l1ZgJlS5J2e2D8qfRiAZplZ5FuS6oN
    XhzegrTUvLMLshR5WLVYINVI1VkPLf6EQzzQntPp4f4CfO1YtSoloe32I+9w
X-ME-Proxy: <xmx:R-wialwmsm7WJhW1PeysoUg4RdFP0hVThJgIJt_tawH-TdrEF48Igw>
    <xmx:R-wiai3ZZECYe4b5noWuc65Ow--1iNyXAM2bR6lVH0Oz6CyrG18qFw>
    <xmx:R-wialxUOtBmFVJwt6aLXC_hJ1Koj5VmMDdhfxVoGm0wX-zUpwPP1Q>
    <xmx:R-wiapFnJeVXfqsTY6IYikssaDySFaVP3k4arC0WUPNnMCTy635shQ>
    <xmx:R-wiaoa-8rVNKpz61--7XNOBC41A8UQwkolhdzlcePhlwhgALiG6a1U_>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 Jun 2026 11:33:27 -0400 (EDT)
Date: Fri, 5 Jun 2026 08:33:26 -0700
From: Boqun Feng <boqun@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: sashiko-reviews@lists.linux.dev, ojeda@kernel.org,
	dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 1/3] rust: rcu: add RcuBox type
Message-ID: <aiLsRpKWnRk5DQBd@tardis-2.local>
References: <20260605133541.22569-2-boqun@kernel.org>
 <20260605134935.B6C0E1F00893@smtp.kernel.org>
 <aiLgJkKzwEDGWNtY@tardis-2.local>
 <CAH5fLgimUgbK_dVwq7RQimOugqJka2bM_u2r5S=3aze_8uCnbA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAH5fLgimUgbK_dVwq7RQimOugqJka2bM_u2r5S=3aze_8uCnbA@mail.gmail.com>

On Fri, Jun 05, 2026 at 04:54:55PM +0200, Alice Ryhl wrote:
[..]
> >
> > [Cc Alice]
> >
> > I fixed this locally by:
> >
> >     fn into_foreign(self) -> *mut c_void {
> >         let ptr = self.0.as_ptr().cast();
> >
> >         // FORGET: Leaking it as a pointer, the caller is responsible to free it or unleak it by
> >         // from_foreign().
> >         core::mem::forget(self);
> >
> >         ptr
> >     }
> 
> I prefer to avoid use core::mem::forget.
> 
>     ManuallyDrop(self).0.as_ptr().cast()
> 

Sounds good ;-)

Regards,
Boqun

> Alice
