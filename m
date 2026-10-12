Received: from sender-op-o16.zoho.eu (sender-op-o16.zoho.eu [136.143.169.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29101371067
	for <sashiko-reviews@lists.linux.dev>; Mon, 12 Oct 2026 01:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.169.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791768388; cv=pass; b=STwCCpVXtorI3VFpQgY7zTOAwngYOdIg8BwewiqJkwE4JxWR6K6dtyv8L3lHNL6m2rpYV6R4hqlnU0MUGUnK9OFtK6JUjAmJhFVQwnTJMWRm2IwGRfgieN8hS6RdKq1zdVDQvKoAyq7t5aYIPP1pQSiGo/1wsN3vWwSv4THhn0s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791768388; c=relaxed/simple;
	bh=uFqd5kbTdJ6yJj6B3F26YPfKVNGzZTBsrSZzCuB3RJc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FXJxpkcwDVTge6gqbwlPV3tVWE0Vyyljb4MhkARcnSUHcJELu6f+D/X/lX596YlHmjooGvFKAU2tP6iA/4TbdBJeKmz1SyCQmxoRmAF2/BsM+qtMPS6zZ1Ik3lqSH7qXt/e+2BiNrGLumZQAxV1yB+hdD7xh2e1q+Ktnv9FbJ7I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iav.lv; spf=pass smtp.mailfrom=iav.lv; dkim=pass (1024-bit key) header.d=iav.lv header.i=iav@iav.lv header.b=PYh2HFuy; arc=pass smtp.client-ip=136.143.169.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iav.lv
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iav.lv
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iav.lv header.i=iav@iav.lv header.b="PYh2HFuy"
ARC-Seal: i=1; a=rsa-sha256; t=1791768374; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=OfdmVW5wdAKufLhZwAAt3SF60k6dzmaShY9nFyGYIp9VduN+W0Sgor/SRWDqtX91GucA2oh6l4ez6yLcLCDoSmfX4X5K3Zix3vBtnMwWpGA4yLoxlaayIKH5hZJxptTBBmN67XjN23gMfF3rXJnyMkeLxE01tuBG2MtJpvzGeEc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1791768374; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=uFqd5kbTdJ6yJj6B3F26YPfKVNGzZTBsrSZzCuB3RJc=; 
	b=ILM4yeaL4WLtqOEm3tleYxE5Uoy6fX/7ilennevXl+x0pdOYsNxZ/gJ/nIIEjoAcmi6wAKL8IqNSZx6m9Uatdavy42rSDw+EcOo+0sC/RRvIUhSmANwd+kj1cooEUU1zktWuoFhR7rI4cg6dzYePe77rQ/BQxfWqo1+kHSDI17o=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=iav.lv;
	spf=pass  smtp.mailfrom=iav@iav.lv;
	dmarc=pass header.from=<iav@iav.lv>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1791768374;
	s=zoho; d=iav.lv; i=iav@iav.lv;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=uFqd5kbTdJ6yJj6B3F26YPfKVNGzZTBsrSZzCuB3RJc=;
	b=PYh2HFuyCBsjyT8mzoVrs+yGKMw6RCj56MjzeFIBLVciUvBDcNk8MGv2qESJVstI
	5atdFoqFzc9At1eGC4h46mdjWFKrzPIGpp6Bi2ZsDHumoor+HfVZNOCj2tA8FQUP6Ha
	yBnuQUCHBDMYnhyHd/ABcId+P9AtSNZDcXLkjmDo=
Received: by smtp.zoho.eu with SMTPS id 179176837190232.44867149174149;
	Mon, 12 Oct 2026 03:26:11 +0200 (CEST)
From: Igor Velkov <iav@iav.lv>
To: sashiko-reviews@lists.linux.dev
Cc: linux-watchdog@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Igor Velkov <iav@iav.lv>
Subject:
 Re: [PATCH v2 1/2] watchdog: orion_wdt: load the pretimeout counter on Armada 370/XP start
Date: Mon, 12 Oct 2026 04:24:57 +0300
Message-ID: <179176829726.3995625.orion-v2-sashiko@iav.lv>
In-Reply-To: <sashiko-outbox-167534@kernel.org>
References: <20261012-orion-wdt-suspend-v2-0-f13cf71443ba@iav.lv>
 <20261012-orion-wdt-suspend-v2-1-f13cf71443ba@iav.lv>
 <sashiko-outbox-167534@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

> - [Medium] watchdog: orion_wdt: global orion_wdt_info struct contamination
> - [Low] watchdog: orion_wdt: TIMER1 clock rate mismatch for pretimeout on Armada 370/375

Both are pre-existing. orion_wdt_info gets WDIOF_PRETIMEOUT in probe
since e07a4c79ca75, and armada370_start() already enabled TIMER1 on
that flag, so this patch does not widen it. On the TIMER1 rate: no
in-tree Armada 370 or 375 DT has the pretimeout interrupt, and XP/38x
set TIMER1_FIXED_ENABLE_BIT in armadaxp_wdt_clock_init(). I'll leave
both outside this series.

Igor
