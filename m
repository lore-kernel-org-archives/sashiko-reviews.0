Received: from us.padl.com (us.padl.com [216.154.215.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4231E54B;
	Sat, 30 May 2026 02:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.154.215.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780106500; cv=none; b=IE9t65JDS9HFZsP9aWgIBzm7gfR28fVj0yI0r9rtqpcnw8CtkUuWErue471lwWOFNW5XvCQleRlhBa0plZ/snoYuZlzthzvLlxH59vUIfyniwECGj/W3z//B/VKwQEzJ5MgFD3onLs/6ob+22kn1uXnahSlfxgveUthYchpi4JY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780106500; c=relaxed/simple;
	bh=tNJoCL23MG/0Sq/8Y2gZ0phbAzaIutf/W2YTfpytKc8=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=G5edBtFXVk7MURgSm/Kg/pyxmo1FSivp2fDwhMWOK1h3P7FDmiTvTCaJNzFN2RCNxGbhr9skQf6iGxbizWH0HXGTowPxl3nBMTQ36LQZm2VuGlVm+ZS9H6uik328IG+eXey/WbUc+pNskJr5XZZXIBPSCe/M1N8AX3H3d/9o9to=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=padl.com; spf=pass smtp.mailfrom=padl.com; dkim=pass (2048-bit key) header.d=padl.com header.i=@padl.com header.b=Na45/tAL; arc=none smtp.client-ip=216.154.215.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=padl.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=padl.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=padl.com header.i=@padl.com header.b="Na45/tAL"
Received: from auth (localhost [127.0.0.1]) by us.padl.com (8.14.7/8.14.7) with ESMTP id 64U21WZb015132
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Sat, 30 May 2026 03:01:35 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 us.padl.com 64U21WZb015132
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=padl.com; s=default;
	t=1780106496; bh=tNJoCL23MG/0Sq/8Y2gZ0phbAzaIutf/W2YTfpytKc8=;
	h=Subject:From:In-Reply-To:Date:Cc:References:To:From;
	b=Na45/tALYD4V1QGCnLwWzgmcwAZ1MJFoNbsZ1ZG59eRDsR9JsDNhlOupw6Cv63xwu
	 VuzMMyNP1BcONoP1kEUQBPJIt1T2m1n7QLlm28GpbQrQwPKk/LUEVCbjxAQdbzRPnH
	 XfwR2HokkieZx5JuN4Mwgri194QuxeabEFouE6yBf37jAyCyM4jJeKAYJNi7rvYJO6
	 +J/z2+V+E9nhM4g1BQk/nPXenKzgTdgfhOoZIsEJ02m0NgLM2ehJT3OBvDMbXEmzLa
	 8rv3h0IL5l2Nrluim3Lx0vidUwl/I0QY7UZWsaVcSQ+gBlmVfuJi43d0rCG6gPT41h
	 CoPOedo9FiuQw==
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.500.181.1.5\))
Subject: Re: [PATCH net-next 6/6] dt-bindings: net: dsa: mv88e6xxx: add
 mv88e6xxx-avb-mode property
From: Luke Howard <lukeh@padl.com>
In-Reply-To: <20260530004918.C24601F00893@smtp.kernel.org>
Date: Sat, 30 May 2026 12:01:20 +1000
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <530D4457-04AB-441A-B887-12C104A5653A@padl.com>
References: <f0a4fc5e6918040b2c9a72da46a8cdcb43ed5049.1779841530.git.lukeh@padl.com>
 <20260530004918.C24601F00893@smtp.kernel.org>
To: sashiko-reviews@lists.linux.dev
X-Mailer: Apple Mail (2.3826.500.181.1.5)



> On 30 May 2026, at 10:49=E2=80=AFam, sashiko-bot@kernel.org wrote:
>=20
> Thank you for your contribution! Sashiko AI review found 3 potential =
issue(s) to consider:
> - [Medium] Encoding runtime network configuration (traffic policy) in =
the Device Tree.
> - [Low] Schema validation fails for all valid inputs due to an =
array/integer type mismatch.
> - [Low] The Device Tree binding description violates OS-agnostic rules =
by referencing Linux-specific netlink flags.

Thank you for the comments. This commit will be removed in the next =
revision, in favour of configuring the device using devlink.

