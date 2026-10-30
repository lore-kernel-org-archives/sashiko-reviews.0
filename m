Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793381262;
	b=ZBy/2yBaGkT771Anob5UyBuczru0DhRhA0wc7Gx1YI6K6NPHsef+0KQvyToXBVIDTxhK
	 5rUnI7F112gs+UcQ64BPQUE/LrHMhuh/X9Keiz4IBw+AWmMYPMhg+K587aKdiqv9mgSzF
	 +nnoW2P9kmjq0WvyTgJYWl+5380Odc9nm6acMB9iB2EWq9wx3cUptohC9tZ6/50YaSRkP
	 mTND6vBX0Di9l5Vah4JSx+lHaQLXw9z1pzmMb5FGRc13ItzqFI49jOlJFgK2adKW9U/oT
	 y1CFjqEJ6xSaOKCJf71cSmE/Ps4rr/vWjXB72/DLUmpPzfszMuRYuEhoyQYIp8Fx8BQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793381262;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=nF+Ovb1DaVGHZAK78t1+T+vvQXvmw97Ih5mhvZvtfOQ=;
	b=QiG/SK3NbdQXn85BdFxrxn4oz3/HBip48aZs+MekjbDqFIocv/PJ6kz9JSQcyPn6ubwi
	 mvIkdRYvjCLQCnbVhUd5Mvz3jA5TBYifIsVkMuQy+09+ZC+sc4//Yesw+QBtl3klCDGFT
	 gW8jE6FK58aZWjTLNunCl4gDoDbSbfB37EokMKnJwNIlD0pQHY4G0xf+aXFzbYZ9eqf69
	 oCHnSb/HBUHeo4YyiQyWuYzGM7GY3gowV8HeQN3y84xvm99fjHMHXwGcajE6BYqP07J21
	 EkrCtIYfZqjiSMFGUb/YSXi47FfCXH3YZbV4JXBJocdErna5I4kPMepIemMXsCtcHTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=SSZic7En;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71160606A31A
	for <sashiko-reviews@lists.linux.dev>; Fri, 30 Oct 2026 17:27:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71160606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=SSZic7En
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 839C61682;
	Fri, 30 Oct 2026 10:27:32 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4DECA3F59E;
	Fri, 30 Oct 2026 10:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793381255; bh=nF+Ovb1DaVGHZAK78t1+T+vvQXvmw97Ih5mhvZvtfOQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SSZic7EniiYh1wLv2mllab378dzok0A7Y6dAyNcct1O40S5T5Lez5xujSFU7yX1oC
	 0GknB7o9jxxYmpe18wzEQkYuLBCL33Ak3rfiWG5HTwLaAqwWDypFCXXJLuOeQdvoEa
	 G8Je3VllMn3eYaPn1Po63+Ny7abDcOCL607zCZyA=
Date: Fri, 30 Oct 2026 17:27:33 +0000
From: Leo Yan <leo.yan@arm.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-perf-users@vger.kernel.org
Subject: Re: [PATCH v3 10/14] perf cs-etm: Synthesize exception entries
 separately from branches
Message-ID: <20261030172733.GF9176@e132581.arm.com>
References: <20261030-perf_cs_etm_fix_non_taken-v3-0-7629b52ab047@arm.com>
 <20261030-perf_cs_etm_fix_non_taken-v3-10-7629b52ab047@arm.com>
 <sashiko-outbox-191183@kernel.org>
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
In-Reply-To: <sashiko-outbox-191183@kernel.org>

On Fri, Oct 30, 2026 at 03:40:53PM +0000, sashiko-bot@kernel.org wrote:

[...]

> [Severity: Medium]
> As reported by Sashiko on v2 [1], does cs_etm_decoder__buffer_exception()
> misinterpret exception_number when decoding ETMv3 traces in A32 state?

As I mentioned in my reply to the same comment on v2, I would prefer to
leave this out to avoid unnecessary code complexity.
