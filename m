Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA60B46EF77
	for <sashiko-reviews@lists.linux.dev>; Wed, 30 Sep 2026 11:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790766736; cv=none; b=GT/UiTsl5s3UQ1ge/p/UOL0/Q9RdN5CZcIpLj+bPgpSrqANxin3ZjAQRuIqPrQVzSzy8Ep3GFPyGFjZ0XhJLe3MfxI61ZPFXUTY4/VR0oH4DPnHM0oustQ2Szdle9XzUav2pfWGXZIg8KPXAlfGUEYBHkLyHzIJ1yAYOhadQrxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790766736; c=relaxed/simple;
	bh=1g0cpawlh0wWGVA3lCyggdCtoH7CJs/p/g1RH1hFSxg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mGQSSg0mmM6oXwqsA+6Y/R7htNvgNDBjydWDE/AL86gzGEMdrU7MHEwpVNZ6Ft0aUPjZ6azfERbrUl7i3TfchKO+L1eb8qMxEcro1nr6WCo2A/zTgqr8aOwYavOMlwsdqVvQEwfZfgiep1P0qem6thkBwXPNAwx0GV7RrgK4iKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=SKEzh0Rw; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="SKEzh0Rw"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E8BFB497;
	Wed, 30 Sep 2026 04:12:08 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 066E73F86F;
	Wed, 30 Sep 2026 04:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790766732; bh=1g0cpawlh0wWGVA3lCyggdCtoH7CJs/p/g1RH1hFSxg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SKEzh0RwSSaNeaPZ5v/OjEYXm3+FHiXMlhOnHs/nQzwSr8nH0cy8rkM/zbbosawQJ
	 JLtuKGruRRX1G9Mx+H7ZgehH9nNQM2Ayz/OxpBXVZgC3MxcKhzEe+sLDpqrm3NfPDK
	 6npKRPjL77p434Ils1F0pleYgRYy/knCVt66yc+o=
Date: Wed, 30 Sep 2026 12:12:10 +0100
From: Leo Yan <leo.yan@arm.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-perf-users@vger.kernel.org
Subject: Re: [PATCH 1/3] perf build: Build the Python extension before pylint
 consumers
Message-ID: <20260930111210.GJ14479@e132581.arm.com>
References: <20260930-perf_fix_pylint_errors-v1-0-f72151d8b255@arm.com>
 <20260930-perf_fix_pylint_errors-v1-1-f72151d8b255@arm.com>
 <20260930091525.B98E41F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930091525.B98E41F000FF@smtp.kernel.org>

On Wed, Sep 30, 2026 at 09:15:25AM +0000, sashiko-bot@kernel.org wrote:

[...]

> > +ifdef PYLINT
> > +# Build the Python extension before starting sub-makes that lint its users.
> > +$(PERF_IN) $(LIBPERF_TEST_IN): | $(LANG_BINDINGS)
> 
> [Severity: Low]
> Does this order-only dependency block the $(PERF_IN) sub-make from executing
> until $(LANG_BINDINGS) and all its prerequisites (including $(LIBPERF_UTIL))
> are fully built?
> 
> $(PERF_IN) launches the sub-make that compiles all builtin-*.c files.
> Meanwhile, $(LANG_BINDINGS) depends on $(PERFLIBS_PY), which launches the
> sub-make that compiles all util/*.c files.
> 
> Does this completely serialize the compilation of the builtin/ directory
> behind the full compilation of the util/ directory and the Python extension,
> impacting concurrent parallel build efficiency?


> Furthermore, does it force an isolated make perf to needlessly build the
> Python extension when PYLINT is enabled on the host?

Fair point. I will update the Makefile to separate pylint from C
compilation, this can avoid dependency within C files, and can avoid
the dependency between perf binary and python extension.
