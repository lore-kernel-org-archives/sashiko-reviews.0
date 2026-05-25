Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0DBB3D1ABC;
	Mon, 25 May 2026 07:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779693930; cv=none; b=pHIsovvcr2Cr4Dxe2QacujXSXzZ6mgirtE4OBj9x84Jp+n+afAqe4pJiwQR2p1n/bHqcWy80XarqWISIxGU1GjCk8eaKiDENh7v/LF9uA2JOLzCR1FRn8J/nKbkFhAi6sBfREz1utb9pnkNUxhtS6jiIXcpaamqluIOR2HXg+qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779693930; c=relaxed/simple;
	bh=QkivxvGFil+cRME5F04tRpkI2SOe3uIdD5QAfSQRevQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vCpvz8fF+hY/pPIjZfji84X1JhCI5MH6N+UIvxOY0SWcVudrMdyyfX/LMLpgOHr7/8kVUDy/NCxRHfWuuPISBzr7cq6LGsruVcLlHaMsIeRe5W6uQ0MqJfLniFWShgQhZVdO04qW7ptFhSBpeNzHmD3h4hDbTrwXnIWjPpHCfho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mxj/DNST; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mxj/DNST"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6798E1F000E9;
	Mon, 25 May 2026 07:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779693928;
	bh=mxb2MbbC3zqyRBaZ9N3MZBnnWOE2nv3ru5fJQzHTs1c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mxj/DNSTrUmNPgAMePhQ/frDvy/FQAfElITJ7cEHHSXjpbiAPCrpV5Sjj5dIW1YLL
	 my2aXsoTUEp0aiPzPYERVq8ZYySs0fHdX4bSQuH1i+WFRtpoBjdsuknYBVfQrpdH8L
	 8b9NFYN7JO8V3r0ATdZWnOeN1JxSxZ1aB5MaMYBSr1jnYzze968BlUoODcwAospAAe
	 jJo5Fl9P2cT9E2vD3pq4qMaRBWn2ppUFEJ5tXYu+2RjR6ZcMDc6+MU0BcC+lO+Ep4r
	 9F4stlfIOAsCXdgbygI3yULBS2sPZW8q0S9kIK9N0QPFlV7lxq2sR0Ftv3rJPVi+Zm
	 Pab+Qw1jXA5Hw==
Date: Mon, 25 May 2026 00:25:27 -0700
From: Drew Fustini <fustini@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v5 10/18] riscv_cbqri: Add bandwidth controller
 monitoring device ops
Message-ID: <ahP5Z1DGXyCrzg4K@gen8>
References: <20260524-ssqosid-cbqri-rqsc-v7-0-v5-10-78d3a7ba9dbe@kernel.org>
 <20260525003608.AC42A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260525003608.AC42A1F000E9@smtp.kernel.org>

On Mon, May 25, 2026 at 12:36:08AM +0000, sashiko-bot@kernel.org wrote:
> > +/*
> > + * mon_ctl field masks (CC and BC share an identical OP/MCID/EVT_ID/STATUS
> > + * layout). Keep all masks u64-wide so FIELD_MODIFY() on a u64 register
> > + * never zero-extends a 32-bit ~mask and clobbers the WPRI/STATUS/BUSY
> > + * fields in bits 63:32 for future support of RV32
> > + */
> > +#define CBQRI_MON_CTL_OP_MASK        GENMASK_ULL(4, 0)
> > +#define CBQRI_MON_CTL_MCID_MASK      GENMASK_ULL(19, 8)
> > +#define CBQRI_MON_CTL_EVT_ID_MASK    GENMASK_ULL(27, 20)
> 
> [Severity: High]
> This isn't a bug introduced by this patch, but does the same fix need to be
> applied to other masks?

I'll switch all instances like this to GENMASK_ULL() in v6.

Drew
