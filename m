Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794382815;
	b=aoY+0fsXytX6e5H8iALxHa5idzuXJSIeB9W6H2hTZbdgeEn99lph4EEXur+XRuBaKMrw
	 uewc78yJene3wveK9Ez26Q690M531y7Z2j+jAIm5rdWWyhTjHDm/Uir/wd0l/dubcrZXI
	 VK1VBbwowz4VrJGReBiQRg/W6duWxNWHuuyGZsuIEDstaeVvunxUAB7tMLb4UwcWxxu4r
	 /PKS5C0v6JtW+0v9auKCkbn+UP9Jr39J/MnthCV+eBSwn1yY0S7ztFM50TNH80T6jcbmi
	 /PUiM7OiDEFqVrA7hJ6Ash5O68L9H+D/oUGb0v1zSuIhP/HfWO5OZk9woOsthHPwZ2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794382815;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=Bo/rSB63QRwvs2FN8ToCi5grrCia6AmWe7fZkN4e0Rw=;
	b=bkk6I9lc0+sWLMwIIC7h2OD+LdkzVfs5+6u6F8CJro3z5YEkCzlkl2PioXgblR8dzw1G
	 iDMjx2Tmg1pMl7DvufnY8ZftGoRfzr5jiJVJf/YpMVlXfvSlEnh/neHz+Z3p8QW/mhwjh
	 dnRSQ/sp0gDnTnSgxVzz5tRg6APt/ASUXTYV/aIVfOFP2gYixmy3rqulcILIiSaSGjgmX
	 bwDsGaAkFU2QLpIk9t6PrhQMj93LrKr58sgaLOvpbdVhLpNGwHZLJyLnhSUHZ3nwBiLfX
	 Ly4yz2O0QpZlsYLtw5P/nkcJPkbD9DXnE7ypIE52DgHCE+vZQXg4bMAH0u5Mnlc9qjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XG9JG+8g;
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB5A606A31C
	for <sashiko-reviews@lists.linux.dev>; Wed, 11 Nov 2026 07:40:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BB5A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XG9JG+8g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794382813; x=1825918813;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=/5gd75ih0pdT9xF7iAYuNB4tsfw40cTZRkTaixbow8w=;
  b=XG9JG+8gNnJYuqL6z0AdR6TA4Gccz5A4HiqI0/wep0lxZkqh0UUt9jEf
   EE2TJGpDb4GV1Gtox1hm3yBHw01bi+KKG3zkbVYg4jXvX/l/MGg4FsAPn
   EgFNdcdCe43OLTIdOKEXTZK2XM0JFjvrTdAIK/4lIUIXHh1swc3Y81mMx
   sfmg6vQtEWcZaesrB2fQF00dQzcnyLmFzxP4E9oSENk2nfm/FzlY+Y5vo
   jYa9nmoPnN4Q3pcBdCqmi1u6YKQ3TCsYHRN+SAR+QAGP9ViC9gcjgw2xI
   w3RVECEmHUcBqPHd528cH+q8csvIgNrvpa64lsKQYJ3StFdfaw9SgMknp
   w==;
X-CSE-ConnectionGUID: CMDc4t29TuO0jDP8OnewDQ==
X-CSE-MsgGUID: RuQ9Z8epQyO8Qwu5DRNh/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3055959"
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="3055959"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 23:40:12 -0800
X-CSE-ConnectionGUID: iBW64SG2T2Sn7MfdMoRD7A==
X-CSE-MsgGUID: L+o+rR5JRcqX5aQRY8/DgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="8778571"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.124.240.71]) ([10.124.240.71])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 23:40:11 -0800
Message-ID: <3eb8736e-6aaf-4b02-a6bc-19f92016defd@intel.com>
Date: Wed, 11 Nov 2026 15:40:08 +0800
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 18/20] KVM: selftests: Add support for per-VM ucall
 ops on x86
To: Sean Christopherson <seanjc@google.com>, sashiko-reviews@lists.linux.dev
Cc: Lisa Wang <wyihan@google.com>, kvm@vger.kernel.org
References: <20261105-tdx-selftests-v16-0-2024e8fa517a@google.com>
 <20261105-tdx-selftests-v16-18-2024e8fa517a@google.com>
 <sashiko-outbox-200423@kernel.org> <au3pwtxF9Qs97mfu@google.com>
Content-Language: en-US
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <au3pwtxF9Qs97mfu@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/6/2026 10:52 PM, Sean Christopherson wrote:
> P.S. I'VE GOT THE POWER:

Great!

> # ./tdx_vm_test
> Random seed: 0x26085169
> TAP version 13
> 1..1
> # Starting 1 tests from 1 test cases.
> #  RUN           global.verify_td_lifecycle ...
> #            OK  global.verify_td_lifecycle
> ok 1 global.verify_td_lifecycle
> # PASSED: 1 / 1 tests passed.
> # Totals: pass:1 fail:0 xfail:0 xpass:0 skip:0 error:0

