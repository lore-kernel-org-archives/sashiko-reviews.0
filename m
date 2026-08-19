Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C4213F210C
	for <sashiko-reviews@lists.linux.dev>; Wed, 19 Aug 2026 08:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787127499; cv=none; b=A335uQAjdrmQxn5JOIukOfaUODU1knyEhGtu9yA0hC2JsAVgC+sXiqZ2qMgEflpMAsfhZOg7v2GmV67NVktj8f0JbbtAXIeqUM06XVMCoZeRiKU+bjIM6q0Y6ChrEM3B1zgSKQvNgz8IICmzTjCDILl+ayJhLbW+Huz1/wz4k/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787127499; c=relaxed/simple;
	bh=ZuWDyIBOdNYDPkNZyP4jSMIh03UuxtWcNBlU6DMMd14=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Vh0p+zDeSAK9Y1i8WM3/Q4ddlVziVlf+un9r3LCAIP7MOELNqJX0Uv28Y3Zk2hkWglnSgHJlh3crFVLNtPXSWlSaEVkqTaMNn3fWBTz9XsYaKbyQVTYcTZcRNJDhyEbu0nEWBl41DwDKI/tS0rexDjvSdwZRJrUst2SNYiNagTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cY78t5cq; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cY78t5cq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787127493; x=1818663493;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZuWDyIBOdNYDPkNZyP4jSMIh03UuxtWcNBlU6DMMd14=;
  b=cY78t5cqbmQmYpvLPi+OfSZLAeR5uIHNvLmD0U7P8KLUIxDicdpt3JDh
   GBAxsI+TGyY6fqhrMtkduCvQi4K8P/ZH7L7vaBsN3v7slcZNfb0LpGoi5
   8k3NQBHeue39WUm56dC/mtS1LRCKa+r5P+QbnQ37Rlsy3snWELXhSaSDn
   Q3KierN832ER8wiofRbt3Gii2/tmK7U/V1XP5YRJb2KBjjvHwlIjYlxPB
   1Juu72ucKSTHq9TVcXpZPs7h/TWtjA/8BF03MWTM1CGGwXRt/p3SaNxaB
   bbbX3MRNhDNvQFc+JHvztLvwGuKUKXLuQ+bfhr7/RwqR91SBSSMUW3dVS
   A==;
X-CSE-ConnectionGUID: gy+nmSwXQpiMq0D+7RA7iA==
X-CSE-MsgGUID: 8y5gFrUmTYOt795ffBuNZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="105165668"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="105165668"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 01:14:46 -0700
X-CSE-ConnectionGUID: 9JdXdAHNTeCYh44PNe0xMw==
X-CSE-MsgGUID: J3kZ9h0zRjmdq051Dtr+jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="270680863"
Received: from tester.sh.intel.com ([10.112.106.126])
  by fmviesa005.fm.intel.com with ESMTP; 19 Aug 2026 01:14:44 -0700
From: Tao Yu <tao1.yu@intel.com>
To: sashiko-bot@kernel.org
Cc: dri-devel@lists.freedesktop.org,
	sashiko-reviews@lists.linux.dev,
	tao1.yu@intel.com
Subject: Re: [PATCH] drm/gud: validate TV mode names before creating enum property
Date: Wed, 19 Aug 2026 16:14:42 +0800
Message-Id: <20260819081442.4092116-1-tao1.yu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260819073834.2714F1F00A3A@smtp.kernel.org>
References: <20260819073834.2714F1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks for the review.

This patch is intentionally limited to fixing the out-of-bounds read caused
by malformed TV mode names. The NULL-dereference risk caused by TV property
ordering is a separate pre-existing issue, and I am addressing it in a
separate follow-up patch.

Thanks,
Tao
