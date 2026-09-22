Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F2A43403E8
	for <sashiko-reviews@lists.linux.dev>; Tue, 22 Sep 2026 06:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790059606; cv=none; b=foY3x9R+LLOWbdF2CoAwPR86ELEot4vOe7Y9BXKmUn3JuMui6L3V0Dxwo5kSOP9sTnu5FFZOTu6aPb4ZVwNzwkaucM3AequoM6P8tmUYeElITUZG6NtjNAhbPicVaNtXW0hD1Kk1iKHQpcBv5xIuUUHN5Gl0g2geHqumyKFPEpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790059606; c=relaxed/simple;
	bh=yPlIafrpnAyWQ6dzKtmbn4aRjT+0Imp8WqIlko9zOJM=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=E8uaCVM7Sf1w0VowgtyuCTW3KO3cnBmHuYcgx4sPXFyLzAOBSuVPap4iOA8do2rCMC+eXG1zzpY/LnXsbP0tkVy5MO9AadzZGS3CrsF2kG4XX0UWzfXdgks4lZAe6kQFdSF/1SQOkqE3rC171oaron61qVHQZahYoK9L1dpJ7PI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ecUmEAjP; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ecUmEAjP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790059605; x=1821595605;
  h=mime-version:content-transfer-encoding:in-reply-to:
   references:subject:from:cc:to:date:message-id;
  bh=yPlIafrpnAyWQ6dzKtmbn4aRjT+0Imp8WqIlko9zOJM=;
  b=ecUmEAjPcCA4f1FVERg5pIRdNiUmu6Zlw70fUkj9fjYqtFJhwuZsUh40
   6xg79Zi3ZqKZFZAFWT6SyCXWXIGvC+l4bIrdqFXWlO7G4g2W9u0p4K3uK
   npZOlo7uFIPzxiSCzcz3poXEl7ie6f15Lbw/izigUyp6ZAa0bIHbgGnrM
   JJQihbujDGQELBAgdQvg7TnHXkc0/S2k48pgmNknmwrK2D25LQbrpbp7X
   iJMwGhQyK12gg1AjK49Z6LkjZhk/k4qcQ90bsFwexo5DnPm9KxLAPUhK6
   XaDDkvtDkGxwCu2ybq3xVa0BUGdruZ8e+ROV77Y9fkLibAVBmDcY7xuEB
   Q==;
X-CSE-ConnectionGUID: GrNYWGJpQoCZlHW2T9xP9g==
X-CSE-MsgGUID: IAP31KKiRF20i3dg3ZWJAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="116155750"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="116155750"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2026 23:46:44 -0700
X-CSE-ConnectionGUID: 2NX+KT+/ROaGkJ9fn/2s3Q==
X-CSE-MsgGUID: P3NALla7T9C4U/dsO9+pqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="273168760"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.25])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2026 23:46:42 -0700
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <PH8PR11MB8040EFAAE8210F2C6B53AC1BF4842@PH8PR11MB8040.namprd11.prod.outlook.com>
References: <20260630223946.2107382-1-jia.yao@intel.com> <20260630225349.984AB1F000E9@smtp.kernel.org> <178290749714.224587.15234445443946207851@jlahtine-mobl> <178292444166.273574.16738251742448073960@jlahtine-mobl> <PH8PR11MB8040EFAAE8210F2C6B53AC1BF4842@PH8PR11MB8040.namprd11.prod.outlook.com>
Subject: RE: [PATCH v9] drm/i915/dg2: Add per-context control for Wa_22013059131
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Roper, Matthew D" <matthew.d.roper@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>
To: "Yao, Jia" <jia.yao@intel.com>, "sashiko-bot@kernel.org" <sashiko-bot@kernel.org>, "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
Date: Tue, 22 Sep 2026 09:46:39 +0300
Message-ID: <179005959984.27165.4749331452130832177@jlahtine-mobl>
User-Agent: alot/0.13.dev2+g40c57d620

Quoting Yao, Jia (2026-09-21 20:33:03)
> Hi @Lahtinen, Joonas,
>=20
> The key is LSC_CHICKEN_BIT_0 is a global register.
>=20
> Even we use per-client,  we should consider the following cases:
>=20
> 1. Should conflicting configurations within a client be rejected?
> I recommend the first setting should be latched.

From uAPI perspective it would be simpler to set this at the DRM client
level at once. However we don't seem to have such uAPI in active use
currently (all drm_noop) so you'd have to compare the complexity between
indirectly setting it at DRM client level by first created context or
adding such an uAPI to set it explicitly per client.

> 2. Should conflicting configurations across different clients be rejected?
> I think the latter setting can cover previous one.

DRM clients need to be indepenent from the driver perspective,
we can't do that.

The whole point of making it per DRM client is that given the
impacted SKU only has 1 CCS engine. We have the address space
matching requirement between CCS and RCS, so when both CCS and
RCS are running, we know they belong to the same DRM client and
thus they will not conflict with the WA mode. And if only one of
them is running, there can be no conflict either as it's just one
context.

> Even like this, still can't cover all the race condition.

Which race conditions do you think would remain? We definitely
have to eliminate any race conditions to land this.

Regards, Joonas
