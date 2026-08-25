Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D67133B19AB
	for <sashiko-reviews@lists.linux.dev>; Tue, 25 Aug 2026 07:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787643694; cv=none; b=Gfv2/YQtM0jF8yiCBpr80WrDR6WyeM14xxtuKvaUA5CuFIKLZHYLkNzz2yEl8htaU6ML+Q4M+aoKG2NQCmQJ/e0IJG3iiOKF9+WBtSpn3GltzM3h0CjSQaLBNjiJ3IMYOTC178JuHB9RPw6Foy8Aac1vjbywl1tOCCoqMYZ5uKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787643694; c=relaxed/simple;
	bh=pqrup3IFBPNsy52D6KGNlh2U2xD769wP546ycJAeeiw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DGkVKUTfjHM7CyYjB/NsrSLfPZFvBQFS7fCYws8SYWVm4psatUxWA9wFujx/n35ThdQVmurIjIJeLwGbitCz1lcnh64lNELDdjkD588ds/f3vhQq+PU0EnqecKMe6ZMF2CNr7hA6hHapFStf0lm4z159VHsE7f7EYRvC5yfF5FM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B0XQpMjr; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B0XQpMjr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787643693; x=1819179693;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pqrup3IFBPNsy52D6KGNlh2U2xD769wP546ycJAeeiw=;
  b=B0XQpMjrn8nXxbD2k5Z69JLP9yeSbZdKFFZeJQWNx28HbufOTx/UcbU0
   bZLsiD5Wj2kU4KhA/o/TEa4DoG3m+xQaOh+2GjfhxIK3c/+tjv77Ihxpc
   2s4SRWg1oOc10Pq7rRlI8hlQGHj4vUsvA4Ow8Xm+VusEMGX9AUx+NGPRV
   qLn2KMksSZpqchA34tNfpzyNikKKccet9vN4NsCZe//nVg4EEERooIa7P
   RobOnzZPWX1ysZt1IYofHFtxhUWY5wc+bPp5rJygCels4gPVqifGHDLv8
   NLSsjnxWFLjPijBPCKrB0ybdiSE5Ejwd01qd8bVpUL/hv1ynnhDktWvQs
   Q==;
X-CSE-ConnectionGUID: QK54Es58Q5OZyTy/O+azRg==
X-CSE-MsgGUID: Jr9HyX0cRYO78/0HQfWrOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="88306542"
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; 
   d="scan'208";a="88306542"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2026 00:41:32 -0700
X-CSE-ConnectionGUID: dRyIzPsrS9azPB3OjlEZLg==
X-CSE-MsgGUID: gmfhvveFTiCbOKNVsb5U9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; 
   d="scan'208";a="263479748"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2026 00:41:31 -0700
Date: Tue, 25 Aug 2026 09:41:28 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: "Laguna, Lukasz" <lukasz.laguna@intel.com>,
	sashiko-reviews@lists.linux.dev, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v10 08/10] drm/xe: Introduce temporary device wedging
Message-ID: <ao1HKIZjbV8Z6rZR@black.igk.intel.com>
References: <20260821112436.545405-1-raag.jadav@intel.com>
 <20260821112436.545405-9-raag.jadav@intel.com>
 <20260821113758.006681F000E9@smtp.kernel.org>
 <45efbcf8-b598-463e-b415-dfee2a3afe66@intel.com>
 <aoyNk9wmOpdyUXgY@intel.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aoyNk9wmOpdyUXgY@intel.com>

On Mon, Aug 24, 2026 at 02:29:39PM -0400, Rodrigo Vivi wrote:
> On Mon, Aug 24, 2026 at 04:30:25PM +0200, Laguna, Lukasz wrote:
> > On 8/21/2026 13:37, sashiko-bot@kernel.org wrote:
> > > Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> > > - [Critical] Sleeping in atomic context due to `mutex_lock()` in `xe_device_declare_wedged()`.
> > 
> > Already discussed, can be addressed in a follow-up series.
> 
> Why can't this be addressed in this series? I believe this is worse then the
> below case. But I really dislike that we are going further with the mutex
> inside an atomic context only with a promise of fixing this later without
> seeing the code...

Because this is pre-existing issue and we don't sneak in fixes as part of
unrelated features. They need to be sent separately so that they are easier
to backport.

Raag
