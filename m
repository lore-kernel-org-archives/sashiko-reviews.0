Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794848045;
	b=GUbHVUsLRp5EgjY4ErktR5WqZD3gjmdnQ4QuQ4I3cx9b9lau/d4pNM+ftZ/GAwwnxcjK
	 acJl/ifzfdEifBSRls1RRrsxvFlgCeYwofGlNje0qfDDu9Gpm66f4rNxi7GxJ1Tb4oyiB
	 xkZtKYaIRrmO92c8qO+SspIjoa3N8IGoL1Z011G3F2jnVpdcCCRvV5sD7HMJvEzYyKPLt
	 QhdFksAm6ysu5WFuDYkCptLxh2qJDPUZvQzWjQMg3pfRKH4JSd3jQzeY3uKDLx0sO1ZVY
	 6uaiGDxZK2LslvuZnI0tFwz4pVcEnX8aqMnueCRgHIftN91OYiOcvOqhFdcvYGXxG+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794848045;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:Content-Language:To:Cc:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Rspamd-Queue-Id;
	bh=S3bxneiWF925sHRWuhmHNR2GbqcJSpHqdoFk1dfbgNk=;
	b=vPMr5+NFu17ETQL7pZZCQaRFmK2U6Ym6xFwue8s7FYdK44AI/46+kSgIqRZzGOXJss21
	 fQzXXr0KHcK/wXkTMbK5A8zNuWbdWKsjzdfIaQXvshXxrZj1T4Xsv2CU8nF6jp9T2YWHx
	 ijm2bVBV40XC6Q85Wn3Qa/HERgtr3gEBj0zhjOz2j1NdR/bVhfQ8fjT+kGDyiaKRwmd1Z
	 VDLrqg28v5np5AKq1gQEJDZdXB4JHCepr01Wu/H1E5jKocsspnE0/lshRzIynq7Bb7Jem
	 SvPgBxxGAY5zztRy242qm3EUQ+Aq22uZGCMHq+PXA5mNcY16LnkyWTC1tSJujcmuXnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pablofraile.net;
	spf=pass smtp.mailfrom=pablofraile.net;
	dkim=pass header.d=pablofraile.net header.i=@pablofraile.net header.a=rsa-sha256 header.s=MBO0001 header.b=QpBEdrTo;
	arc=none smtp.remote-ip=80.241.56.171
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12372606A322
	for <sashiko-reviews@lists.linux.dev>; Mon, 16 Nov 2026 16:54:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12372606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=pablofraile.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pablofraile.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pablofraile.net header.i=@pablofraile.net header.a=rsa-sha256 header.s=MBO0001 header.b=QpBEdrTo
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4jSv8S1kT6zMlkh;
	Mon, 16 Nov 2026 17:54:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pablofraile.net;
	s=MBO0001; t=1794848040;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S3bxneiWF925sHRWuhmHNR2GbqcJSpHqdoFk1dfbgNk=;
	b=QpBEdrToFOfl8yju8CirB4ZkETT4dw5APekHI/hflqRyCmjBxERXDdGZhNTE0IueDZl5Sa
	QLkNINVXi4fL1IPTsuJWt38Hf4XLqrmOPab1MN0r3TUbkwms6zzrXrp0MeWrobjK0xK2bH
	soZI7RSL0bS2cDJfGqp/KsK9obDP7cIFja4SadsCE9ngfA/dtjRenuNRPZ/s9ywJaIFjpX
	biv4/2N70URinIbw2J/qM3Mi3P1b2E8uH6hHvfA00MMt7rbqhS0fkcjQ4Q/1rhPTp9SYVv
	0677LUxOLqgth/kBEeEt9pMBilm3eWHw55XuZ8sLmH6t8WufJhhw/q8QGuH4nQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of pablo@pablofraile.net designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=pablo@pablofraile.net
Message-ID: <83290e65-131e-4aea-ba79-e1453445e872@pablofraile.net>
Date: Mon, 16 Nov 2026 17:53:58 +0100
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
Subject: Re: [PATCH] uprobes/x86: Fix bypass of two-byte opcode validation
Content-Language: en-US
To: sashiko-reviews@lists.linux.dev
Cc: linux-trace-kernel@vger.kernel.org
References: <20261116-x86-uprobes-two-byte-opcode-v1-1-2b6dbabead52@pablofraile.net>
 <sashiko-outbox-217334@kernel.org>
From: Pablo Fraile Alonso <pablo@pablofraile.net>
In-Reply-To: <sashiko-outbox-217334@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 4jSv8S1kT6zMlkh


On 11/16/26 17:01, sashiko-bot@kernel.org wrote:
> map-1 opcode against good_insns_64 (map 0) instead of good_2byte_insns,

I checked the parent revision and confirmed that the reported REX2 behavior already exists before this patch.

Previously, REX2 map-1 instructions also reached the first OPCODE1(insn) lookup against good_insns_64. The in-place opcode modification in insn_is_nop() is likewise pre-existing and unchanged. Consequently, the examples described here have the same acceptance/rejection results before and after this patch.

This patch specifically addresses the validation bypass for legacy 0x0f-escaped instructions. It leaves REX2 handling unresolved, and I can make that limitation explicit in the commit message.

I agree that prefixed encodings need separate attention. I was already planning a patch for some VEX/EVEX handling issues.

