Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DF14394793
	for <sashiko-reviews@lists.linux.dev>; Wed, 26 Aug 2026 21:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787779176; cv=none; b=jvlmgG1TxlX43Lqypdpyyd9SsXIPtRk8QzPAkCkaNsX8Jw4v85WCYBo9piW/gS8z/5jVuyDkLGC0CxlhXaeKd9LVn6lnQGc812p1q3fvoaL7Rn7JnUn31kzujq0SEj5HdgkNkpr3Cnqjp4EMQiR9UHl4qytqSFW7FvvElKbztXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787779176; c=relaxed/simple;
	bh=zOU3jhEls2nlcQi6nn7A7bCR5iYoUqPrg5AVUP9NoEo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cYbuWQXSqJMxI8w8ENDhzAz0wrYxaHcPlgvjYqtXQhoxYh/FHjdGj2j2BSBhPIvkZfxj1lh2lAufNFzh+IyEBAtraNGWCcrFYVGhq2nJKx9L94MdaEfzeITtwh6xhIYZ5wwbAV5qFj5iKajMnvXqaXKq6gmtm0cKp3ktq8raoZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DU6dx+t6; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DU6dx+t6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787779173;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Hs9Hk1Yz77p64quQu3QJjbDqz+Gy/YAoNjsZDx24MPE=;
	b=DU6dx+t6OTHni+B0JCLYPCmkq08K1am2brNggm4PwOIh/sipNjP4G6s3dAepKmo7vpcE2J
	jlmF5UyVsUpt8S+JZGO/BV6fe7yrk/nlX2w5J4yAtYc5/e4p9UuNmRXIyV20ctGpsDYvDc
	bG0dPsP6r0P7sxXXSmBd/Dv95iRdQLU=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-112-YYCLZT3COUyWOrjWsmIGgA-1; Wed, 26 Aug 2026 17:19:32 -0400
X-MC-Unique: YYCLZT3COUyWOrjWsmIGgA-1
X-Mimecast-MFC-AGG-ID: YYCLZT3COUyWOrjWsmIGgA_1787779172
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93771aa0379so4964685a.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 26 Aug 2026 14:19:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787779172; x=1788383972;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hs9Hk1Yz77p64quQu3QJjbDqz+Gy/YAoNjsZDx24MPE=;
        b=hMR/2Gc6JVojcYWhGUATUSXiBWEmyQt2252lS5aUHVpNxSNh4WgzwhE6cxhYvS0kxh
         cK7NCmbZSyQU6nx18iM1oZkM8OT0BJUeExReQEsZUb3UPiYmq7pI0/oDKuDh8NQIRZPT
         1Nhu57wXWj5Kokn2SYcc4rNLkl6J5QmrN8V5McQWzgX4VTY+EvT5p5GWKtqldWvVkOl5
         XHmBxBakQdbiFQMHfrpaRNjfWNjwkmtrzLGzjIxcdu5Xa+hN+lfskAWjz9oFcoFcsNgo
         BV1nHFPmY75I5fAJ9vrjtIsDKLG+fHLOGMBRCOJO9N/vsyNrgAdaCb/aXbrzcpgare0P
         oRQg==
X-Gm-Message-State: AFuF++lMx2tnxSUNMS7OTMfL5PpgjNO8KZOqr1hg1fNv3bP7+UqZFGrv
	WAuQdHP/TFVt741jw73QWg/ZZRdU4Vc+z8ODjQRhop42bXX3ZbNdCP1fNKjHbqkYoNY3w9iwNfi
	wVDZlYCBhA8YrZrtLRGh/3nuS4dOTZ5OE7d1WP8SagGBdgDr6Cf/mCIKv6uPqUCPe0m1SdZdpa9
	NwSw==
X-Gm-Gg: AR+sD11AYifYBcetjTg1kZGr6hQujpe85KXcdp9LAo8n9a2zt4TxjMYP7x5WzTRi/b6
	ZeAlBw4HEH6bGDTplzrIdhsAeVOrkRN8WattImIUSX1eLiOkSM58xpyodC5M60eQacOtm27qWvL
	hsNxZFPjshzFOr2FgKCXD3Mq5VNQX+qFeX4bJ23JNH+ptijhgxpKLpGWyOi/Xte9NyrNIXzmkPe
	6Brg8K48y4J0ZxpDExbSErhclLKP2YxjWULIZFUsv5FjPO7pHlj7DicDDHass89sVpA+IG2AZZv
	vB4BnS7SOeT282KlqPe2ehfsb4Ihn7JrJfnrL5/RUmFzdbHSqpPA6HRwlQVgLMYEsWwrGhH9lGY
	EtaD98VRQnbQeuHwCy42XaQHz+iJyv12b
X-Received: by 2002:a05:620a:3622:b0:937:4524:68d7 with SMTP id af79cd13be357-937803e1d93mr868630785a.22.1787779172212;
        Wed, 26 Aug 2026 14:19:32 -0700 (PDT)
X-Received: by 2002:a05:620a:3622:b0:937:4524:68d7 with SMTP id af79cd13be357-937803e1d93mr868626985a.22.1787779171607;
        Wed, 26 Aug 2026 14:19:31 -0700 (PDT)
Received: from crwood-thinkpadp16vgen1.minnmso.csb ([2601:447:cc01:6890:c623:cd89:345e:99f3])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9377e36879asm301819285a.17.2026.08.26.14.19.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 14:19:30 -0700 (PDT)
Message-ID: <588ce7912915573ccba7439d7e50a90d7941c764.camel@redhat.com>
Subject: Re: [PATCH 1/4] tracing/osnoise: Per-cpu mutex and fd detachment
From: Crystal Wood <crwood@redhat.com>
To: Steven Rostedt <rostedt@goodmis.org>, sashiko-bot@kernel.org
Cc: sashiko-reviews@lists.linux.dev, linux-trace-kernel@vger.kernel.org
Date: Wed, 26 Aug 2026 16:19:29 -0500
In-Reply-To: <20260826153132.1333fac6@gandalf.local.home>
References: <20260824211544.3984835-1-crwood@redhat.com>
		<20260824211544.3984835-2-crwood@redhat.com>
		<20260824213037.F41B11F000E9@smtp.kernel.org>
	 <20260826153132.1333fac6@gandalf.local.home>
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xD6RYkJ2juLfaNVksfzOqtigSKNb38eexPlg0h4TLiA_1787779172
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2026-08-26 at 15:31 -0400, Steven Rostedt wrote:
> On Mon, 24 Aug 2026 21:30:37 +0000
> sashiko-bot@kernel.org wrote:
>=20
> > [Severity: High]
> > Can holding osn_var->lock while calling kthread_stop() cause a deadlock=
?
> >=20
> > kthread_stop() blocks waiting for the target kthread to exit. However, =
if
> > the kthread is currently handling a migration request in
> > osnoise_migration_pending() (shown slightly earlier in the diff), it wi=
ll
> > attempt to acquire this same osn_var->lock before it can clear its stat=
e and
> > exit:
>=20
> This code has a lot of nastiness in the locking with regard to the thread=
.
> I haven't looked deeply at your patch, but the fact that Sashiko pointed
> out a possible deadlock I think you may be hitting the mess I was hitting=
.
>=20
> Have you looked at this thread: https://lore.kernel.org/all/2024082013000=
1.124768-1-tglozar@redhat.com/

That thread is about user fd sync, which is what this patch is trying to
address.

This particular deadlock is with kernel threads, in a corner case of
getting migrated even though we try to pin them to one cpu.  We can get
rid of this migration code and just have stop_kthread() take care of it,
adding a get/put_task_struct() so that it's OK for the thread to die
early.  This way we can also handle any other abnormal thread exits.

I'll respond to the rest of the Sashiko comments soon.

>=20
> It has some tests I ran along with tracing that detected issues. Of cours=
e,
> everything needs to be run with lockdep enabled too.

I did run with lockdep (and some custom hacky state tracking) but
forcing migration is a hole in my test coverage.

Is there a particular test you're suggesting?

-Crystal

