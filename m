Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9155E3F7AB7
	for <sashiko-reviews@lists.linux.dev>; Thu, 16 Jul 2026 10:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784199337; cv=none; b=lzndlUSzs/nR91OSgd+LRWq0uZKK1bAb2inJr3GjNLAxjunU6gKOK4D7pFbhgj8pgS8L60hEn6j+4zuDhGdQYN9+S/RNcfI7xdozZymjJJidJYHVYs9gVQxxXFDjwgrqReo9+8+5bC6aMe5i9A6mTbwqmprNbslhOj8DaJcB8wY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784199337; c=relaxed/simple;
	bh=syUzjHQFMH6SscQ122bosB+/6wNUCxQyomT+FmLfH4Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ks353mMbjQKS5aj+awZhM6i8pi7Y//9/EGyS9iqx0uRQgIaC0cE20JBKaNW1PdwyMpvEc9ULR3RhyKYXAEkCm/jGgfmsTMbvgYjNNhjAOhoDzD4hf7oZfJtbVlyyJwvm86rq4UDXg8+6yoDPnZUkwGDfXYeXeE2VbK/DcQT+0Ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=M89QoIUj; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="M89QoIUj"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1AA8F4E40E00
	for <sashiko-reviews@lists.linux.dev>; Thu, 16 Jul 2026 10:55:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E3015602B8;
	Thu, 16 Jul 2026 10:55:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7C6B911BD2C23;
	Thu, 16 Jul 2026 12:55:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784199331; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=syUzjHQFMH6SscQ122bosB+/6wNUCxQyomT+FmLfH4Y=;
	b=M89QoIUj1Y7mkuZC+GjqJxxGDxON+BksqGgK1JCrHIubESWgnVKRfCxbzFOda99fNJFbEv
	vEboejEEB+O/WzoXne5R4QEWnfVFM9auhUGSm7yrMHmzRNU+i51b6Ba28kOYrrhamGv7uU
	WpxOv+n5DSiM3792DYidInuC4+dNc8CrkE23w0SLJc0dHE/VOlBOFifBhRy8pPXCcp4evr
	q4llKbQUIax0O0kVgq2JEOpXSM8qkDhNa58sUT4zAHj/qPYE436tW3A4U1f/6zgNNKS6TR
	pplxpXDzTJtEVO3gEx2UNPxSNBScCOWD8J43VwpkkHHqDMGjpAtoag5VnDVgFQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: sashiko-bot@kernel.org
Cc: sashiko-reviews@lists.linux.dev,  conor+dt@kernel.org,
  devicetree@vger.kernel.org,  robh@kernel.org
Subject: Re: [PATCH v2 6/7] clk: Add support for clock nexus dt bindings
In-Reply-To: <87o6g8e7wj.fsf@bootlin.com> (Miquel Raynal's message of "Wed, 15
	Jul 2026 14:47:56 +0200")
References: <20260710-schneider-v7-2-rc1-eip201-upstream-v2-0-b4680787377e@bootlin.com>
	<20260710-schneider-v7-2-rc1-eip201-upstream-v2-6-b4680787377e@bootlin.com>
	<20260710183359.61D3A1F000E9@smtp.kernel.org>
	<87o6g8e7wj.fsf@bootlin.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Thu, 16 Jul 2026 12:55:30 +0200
Message-ID: <87h5lzcifx.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3


>> - [High] Unconditional dereference of optional `out_args` pointer in
>> `of_parse_phandle_with_args_map`.
>
> Does not happen in real life.

Does not happen, yet, kdoc is incorrect or implementation is
incorrect. This is totally unrelated to my current series but here is my
proposal to fix this:

https://lore.kernel.org/linux-devicetree/20260716-schneider-v7-2-rc1-eip-of=
-fix-v1-1-9b9383f936c6@bootlin.com/T/#u

Thanks,
Miqu=C3=A8l
