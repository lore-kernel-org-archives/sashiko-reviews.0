Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=216.40.44.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793889174;
	b=Ap3QTENwBkYmSF4A6ZtGMlzdog1Cm4FKNiGFyiJT/6WTWIr+2HYTVWB77kslFv5P8pfO
	 FvEe92GHLk+uvC2dtJeTNOWvTviVOkPeTmyhz4IdmxNr1ZbKXZ1+IJtHvMCgc3vKG3yNP
	 KjFocC2Aqm4B9ZNeeid8bfUVQnQDiG69KDC4Yf7BudfKobwIoQCRwTt0vh0uTH1fTTYxs
	 osSABVa3pR0aPCBn6lCnmDR6u16RuNNiVpuB+cU8JEKTjeotGEVcAoRSNSmk0yfpKqb1D
	 rT/NTWGX0m3hzansOGcbowuBMJ+LKQCV7V0KGo4rcNvGzVo5Qrw6XkqFFp6rNdF3ziw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793889174;
	h=DMARC-Filter:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Rspamd-Server:X-Rspamd-Queue-Id:
	 X-Stat-Signature:X-Spam-Status:X-Session-Marker:X-Session-ID:
	 DKIM-Signature:X-HE-Tag:X-HE-Meta;
	bh=1/giLd5dcTdfTnPTrP6WDd4N/voIOD0k3NX7FhgMSrY=;
	b=L090kpdDRITOzKgAEdXh5Y8GmZn6YxAfTC8kAeHI1IwMQiy8ddRlCnV188s0gACwBnsE
	 dOafwFQJJ3nNAgLToAoSFY3Fm0P0CXmvI9hZxRykIPrOsBru3m/NY0lHD7bO7zZF5ymQA
	 Sh7wGixbo0jwv1aHYNYL2VnsrExJSu66LxzabXQHNiPWtnO+fu4JdXA5gFdXx5qvaFZId
	 89zZfXYPY28o+qNPUo0aRuxzA0vwAReHnBiPDn0JBtg86Ujt25bw0633t3ynjgoZ7Y8oM
	 wzP6LPCifYK4XwPyNMgtI8jlrhsEa3cFNhCoIpOOboc86/IzS6as04RsikIFROLFJKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goodmis.org;
	spf=pass smtp.mailfrom=goodmis.org;
	dkim=pass header.d=goodmis.org header.i=@goodmis.org header.a=rsa-sha256 header.s=dkim1 header.b="foh/8k/F";
	arc=none smtp.remote-ip=216.40.44.14
Received: from relay.hostedemail.com (smtprelay0014.hostedemail.com [216.40.44.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01674606A31B
	for <sashiko-reviews@lists.linux.dev>; Thu,  5 Nov 2026 14:32:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01674606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=goodmis.org header.i=@goodmis.org header.a=rsa-sha256 header.s=dkim1 header.b=foh/8k/F
Received: from omf10.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay08.hostedemail.com (Postfix) with ESMTP id 1DB001409F6;
	Thu,  5 Nov 2026 14:32:42 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf10.hostedemail.com (Postfix) with ESMTPA id 7366832;
	Thu,  5 Nov 2026 14:32:40 +0000 (UTC)
Date: Thu, 5 Nov 2026 09:32:39 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Yaxiong Tian <tianyaxiong@kylinos.cn>
Cc: sashiko-reviews@lists.linux.dev, linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ftrace: speed up module enable by binary searching
 module symbols
Message-ID: <20261105093239.6154d9b1@gandalf.local.home>
In-Reply-To: <e60a0b6c-85c1-424d-ae57-a7239e4ef776@kylinos.cn>
References: <20261105031530.280442-1-tianyaxiong@kylinos.cn>
	<sashiko-outbox-198512@kernel.org>
	<e60a0b6c-85c1-424d-ae57-a7239e4ef776@kylinos.cn>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: rspamout07
X-Rspamd-Queue-Id: 7366832
X-Stat-Signature: p14od17inis9wxjs6jcyhu4rjnaqugak
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+6NuVhjbbqnVwtGTXuR8o0PTiVaTjUHYQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=goodmis.org; h=date:from:to:cc:subject:message-id:in-reply-to:references:mime-version:content-type:content-transfer-encoding; s=dkim1; bh=1/giLd5dcTdfTnPTrP6WDd4N/voIOD0k3NX7FhgMSrY=; b=foh/8k/FITcn7t9zYuWbYG5JnfGFerKgg4wKjZMpW6LSORyYbEad66a1e0Mh95wl/mZUj4JpTVqL3hl6M6yBmCCk6hlb86u65N5jUPdkLzhzq4koBT5d0ie2b9gZJcnRChkwk/yCwFnKfwXMpuNZ64at9l3WvPMRwQK25ly+66k=
X-HE-Tag: 1793889160-948809
X-HE-Meta: U2FsdGVkX19T0hpionkWbb2YSnHohkhqJ9S8EOL/1HUYNpdqABTjFioyY4NJfI2bnw94ON0D02Tmhyw+l+W2NVNCLL/168MJkKx5TuoMWfeDNh58B8wirBFNQgoSIW+oSpb/nA0j3T/b4Td9Pn6OQgtMfwPH5/tkAABl4/GTh4SSX7TalrKzVtSYCxH1meMopRUwgixSCvRDc1k5bEawQUEFr0t3ctPDGxsICLjWfz4yNHIz64kqG6Vk+e42bZ/PmudYeP/9Z1Eb9vXLs35Tc61Y/togMBXn5b84IUVc7Vm06EprzownOnDk6JkoYMzR

On Thu, 5 Nov 2026 13:44:33 +0800
Yaxiong Tian <tianyaxiong@kylinos.cn> wrote:

> > Should ftrace_mod_syms_alloc() call is_mapping_symbol(name) here instea=
d? =20
> This v2 is based on v7.4-rc1: the patch's index line is
> c7d74b33d36d..255e813fe70e, and c7d74b33d36d is
> HEAD^:kernel/trace/ftrace.c in that tree.
>=20
> is_mapping_symbol() no longer exists on that base.=C2=A0 Commit db91da8f0=
518
> ("module/kallsyms: Rename is_mapping_symbol() to
> is_ignored_kernel_symbol()")
> is in v7.4-rc1; on that base include/linux/module_symbol.h defines
> is_ignored_kernel_symbol(), and find_kallsyms_symbol() uses it.
>=20
> The hunk you quote (is_mapping_symbol) is from the v1 base
> 673a54fdf392, which predates that rename.=C2=A0 The patch compiles and ru=
ns on
> x86_64, which defines FTRACE_MCOUNT_MAX_OFFSET.=C2=A0 powerpc defines the=
 same
> macro but uses the same common helper declaration, so there is no
> arch-specific issue.
>=20
> If the review tree is older than v7.4-rc1, then is_mapping_symbol() is the
> right name for that tree and the patch needs a rebase there -- but that is
> not the base of this posting.

Yeah, I'm not sure what it's basing this on. It may be using one of the
stale branches of linux-trace.git :-/

-- Steve
