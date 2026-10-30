Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793358763;
	b=GGWuF86H/a1mPCmEIX1zBMgF2alP8DP1HFoX/RsWCEEKKZnQoCIre3PMz+AqHGG4FoUy
	 i05bTcJSnsoNj+EJiP8kZhzsXgZ+y13jn5b5CmostQVansOWHzszw7/h4hDSc0tT9TnvD
	 xsDc/7wpT3jlqUuwI46zWCzLPyW7XegPwXvlP1z39EpXmhKJ9bwFmAQ6/QEMHz/kDviox
	 iJANV6EMZXoibchLeQz1VtCGpm28KLQrn1V8B2pK3yHp96Epy+bX1krMtOvXKdO43OcPF
	 3lTBBaIJTmEz7XxF4lvAtrWegax/KnTkOLOPthNvEsRqxDeUF0NldYIWC+sXLafEVCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793358763;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=2Nk3f1ZWjruFGIwd5hal19bn66v2e7zdR6KPnrJX3pE=;
	b=4RJyag1+4ZGrpOeLzJStOJqa4zb48DhHc+LXjwcumlzWEzZeZYFdkfUjeJtHu7ctTi2g
	 unKI2aX6kv/+djpzAoR5DgE7ETqqN9z2rJ/WVc5xBbgFZTfGKg8Vxpa+DW+mX/0zRRSfB
	 j2ET1AzWuG/hFafq+GLXCi2OutLHyRDZjgDJMVqcqvzNCT+QAlrAE3px5qi++bt1CUiW4
	 7uZ9M6eFfOx1SaNV7ce2DaL4AkkWYZDV0/3D3yxj94MrdbuCFGkmOy0HiEnpTVrPXB2hY
	 N6vMMyTDd1bZL6zlGSnIZ7WGlYSEqeNPlRXS2aY3lL9SvuzuP0uVI5J1uHBQQprnktA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b="Ob/kANni";
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DBDD606A31C
	for <sashiko-reviews@lists.linux.dev>; Fri, 30 Oct 2026 11:12:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DBDD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Ob/kANni
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9894E1595;
	Fri, 30 Oct 2026 04:12:33 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 624053F7B4;
	Fri, 30 Oct 2026 04:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793358756; bh=RV9VREhWtFmkMT3qPZSsIrKTFx5/ojmZmrkFWSiIKOk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ob/kANni4b1AT5plW89Ctg/tC5nw4uIUWuRdNxfAIRU/J6FSrzJ73rC5/n5Zu1lnY
	 +7KtyKjRd95IRV3Pj3RN7g4SqClHiG8SWhT5ec9zh8vR8iLJXN4nk1B8SDgWrK2f5H
	 5VxRvc+zdJA5SYCw8nEzDtSCjBDuSHbSuFCznHMw=
Date: Fri, 30 Oct 2026 11:12:34 +0000
From: Leo Yan <leo.yan@arm.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-perf-users@vger.kernel.org
Subject: Re: [PATCH v2 10/14] perf cs-etm: Synthesize exception entries
 separately from branches
Message-ID: <20261030111234.GE9176@e132581.arm.com>
References: <20260923-perf_cs_etm_fix_non_taken-v2-0-6ab8c07a5455@arm.com>
 <20260923-perf_cs_etm_fix_non_taken-v2-10-6ab8c07a5455@arm.com>
 <20260923163605.3962C1F000FF@smtp.kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923163605.3962C1F000FF@smtp.kernel.org>

On Wed, Sep 23, 2026 at 04:36:04PM +0000, sashiko-bot@kernel.org wrote:

[...]

> > +	/*
> > +	 * For A32 and A64, exception calls execute a four-byte SVC, HVC or
> > +	 * SMC and save the following PC. Other exceptions use the interrupted
> > +	 * or faulting PC, including traps on those instructions.
> > +	 *
> > +	 * With a shared branch target, no instruction has completed
> > +	 * at the target, so last_instr_size remains zero.
> > +	 */
> > +	if (elem->exception_number == CS_ETMV4_EXC_CALL)
> 
> [Severity: Medium]
> Does cs_etm_decoder__buffer_exception() miscalculate the instruction size for
> ETMv3 SVC and HYP call exceptions here?

It's possible. In practice, we don't have any known perf users relying
on ETMv3 support. I'd prefer to leave the code as is rather than
introduce additional complexity.
