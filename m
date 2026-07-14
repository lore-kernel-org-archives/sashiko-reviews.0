Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C19A843CEFC
	for <sashiko-reviews@lists.linux.dev>; Tue, 14 Jul 2026 09:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784021443; cv=pass; b=WTSe/Hpc8IIFB2EA54S54mcQi847p56NXcCmSdAPORqCe/TY56WSu2Pn1VKQSriburjqKlr+ETxpKlHqjFb1lfBZlLCaMCsK98O49Ji3BpB72RD1KlPahC+LW0FY97FGiEF0v54oui8hJVjG8o6kQlDxJ2LIZZJ1Tf+VBFFcu8Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784021443; c=relaxed/simple;
	bh=I6G3Q+FXZ5EmFID/Q3+wjhwXv5YFhtj8kbKtXbaP7aQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=roLRYSmRLaPYCRlBJUuG2qbeoQy2bEPzJFRHXuP73qmhDUevPW6AbDsXCYg4TmrU/i0e8cgi6K5D5zqaTLmVKcSYlu0YgAxkxKNhfgVQhq93NiVmlaD00aHTuoSWMmmOb4oyVDui1H+gQJuS8vLuYvGslYO6uySHbnMIHB2gCiA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KFdp8ADD; arc=pass smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KFdp8ADD"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ceae1ed204so8637655ad.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 14 Jul 2026 02:30:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784021434; cv=none;
        d=google.com; s=arc-20260327;
        b=EsDoyFrpawEWsvt9Nfjbu7LdPPJyOLwYYJDoTUc2zZOmU+kq2F+nhJYay2XV1Hzsvj
         OwR+nu0Jiha8Itk/lZyPsfhlWI16QoPu6C8e6KpVgdEPd5fhMQ3n8PmcSOKb2qYsqx+S
         s0gBzA5d3T04EFmSkb4bu+jPizoUXDz5DMlS0FGX/ZQl7QTA840jjwFn8YGyznEaCm8i
         s5GqFKkleUicQ4ZfQW3HlwPALMf6hO6vIyI6E8oHx6gamahNVSJk2YqQr+U7jzqJP++Q
         hrQeI+1wnSPbD/ujYNHVpRc8hGLxJwol/Ip5crznblgihAamPA80m4Oja2uur2KQx8/b
         Nb4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=v+QJ/aXOEJkF1qKOqd78f73WO0NWahWbfl7RnnArRcg=;
        fh=+68pE922n3bFxvFH476IsgDH5KHU7Oe9O13KVvgBe/w=;
        b=RmXDgjuk/56yywYJfWq4MCnf9m/21Km0Orpr7kp9GYQP7OO/d5Q+KJvhdrmTIrj+Zm
         lZNkSKQUx9LkGOQbGpL/h35bj92M35/5DXN88Wt9Ymrs5OQ4xAoBo/mbrizA8kEhPN/b
         9OyG1mk692jI2uYBZKLKGmm/mgHhXFTNEQRG12GsgOYfYn4BhVp67PUtZPfjPKHwh/Jn
         cUSYg+yKF0rLivKY1W+EUEEA0s6kltHV+x0U3E2HJdd6YGXJbugAQaW1ROMQnPQGQ4/Z
         UPlF+OAHbxn5CSma/Bmxt7B6jHemviDQOSVmegCxTTCRtCRYSqCbYnEiJltgL7F249tm
         e7NQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784021434; x=1784626234; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=v+QJ/aXOEJkF1qKOqd78f73WO0NWahWbfl7RnnArRcg=;
        b=KFdp8ADDvXw2Ao+TmJtzW+KW3cgH79xb+p389OiVofwaiOsUynNJEXd/laQn5daMim
         TfvTADUrk6KZvu4Hljc+fPBdUOpqZNhXq7AJzZvKA8Etf/c408p+TfGWC7cHnr53TVH6
         IsN8JU+BLPhhitzzmuWuA62sI/C8oZPJ9MJo3LIrucqEPEcpP53QhqAGcEBBpVUa20uc
         1QBJuiiwjZpLLPTC1RLmP618qIPDCE+AQMKxi4JORjB+NEjX/piT5r9U0xFHnxjeCmeZ
         bUuu9parvFs0nkl3o/ecGn8uAm6cVwFffKsL+JrboiJvg6OMYeXHhDWI/M6J95d2UaYu
         urww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784021434; x=1784626234;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v+QJ/aXOEJkF1qKOqd78f73WO0NWahWbfl7RnnArRcg=;
        b=WMfTlPnOz7VSY0IgRKPVh4FjLNIq7kRZVcIDm9p5hxyCAZTt8YjECoInz9+qHPTKee
         4loe9ySga6/F8+myBnTNjwmA1bb/lbILw2Tn54ZfaeuNyP3tBXjeoHeNIdgkMcpfK14c
         BF8b0O5xC9RYD54VFglGhwyESrcVvivqOkU3yFz1tinAmrHDXyux9IMpMmsBd/BYBJfk
         0tUY9kryjInkyiog6FOZZRSWnvPELZG5G2KifqBzLERxqDLTBmd5R6DTxXlh5nJS0ZiB
         MPVIxh+8kpikepjYn1jL4ggAAtELtlnfsK5ex9R4AHW6bB+aNa9V645TkiLfnWVFj1ff
         gDsA==
X-Gm-Message-State: AOJu0YwvE1lHItMVvg7uwrzt/WIvIlHNm7rHagi+9jedwxfoyvQx6zh0
	ybMBtFC89lRi+RLcAd0mgWo+QLm2RfYHtfMJ1acRHSjYdmDDOwyH8nXJ9E1ylXMCUo/XtlCFKkO
	caMHnkex9SxyoUA/Oe1s2eCk7ICAFQWdsMQglN3cm
X-Gm-Gg: AfdE7cmtFjMyJowmU0oKmTVfl5f9kG4jHbzeZSFesP54Ivzw0LOJNeimrOb/igjjZDe
	4NwN1HBwMocAt7KLlFy6sfnPzEmi83jN6RTCPIIdWToKZWLoDP4tiNFBBl66v/6fSg/8YTsi6pa
	H4srUueTtMxgZjgkYJAfqiebKrrGs4NxGkFfFbYf/GGShDeALRed0gvww+fk8JVUz12WWKY5H3Q
	//zxh+cgAugrB2vrssPNTjwhOBFEoerJByrH4PsWgAqXT84cSnFepBOjeUeEm3h/P08v8JFwehu
	YYRGxBspkCvM5yxMaxZgpwDHVo1axVmir0nbAUhyAUNhkavEcaSU8zpyPvRmIrt/xYpEYgwpvph
	r0ETk21K+BeQ=
X-Received: by 2002:a05:6a21:496:b0:3a2:d79c:416c with SMTP id
 adf61e73a8af0-3c110a0ec3dmr14089180637.32.1784021433321; Tue, 14 Jul 2026
 02:30:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260712212113.181121-1-kuniyu@google.com> <20260712213422.DB1111F000E9@smtp.kernel.org>
 <a2afe72f-5098-4a6f-9df7-b993f186337a@hartkopp.net>
In-Reply-To: <a2afe72f-5098-4a6f-9df7-b993f186337a@hartkopp.net>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Tue, 14 Jul 2026 11:30:21 +0200
X-Gm-Features: AVVi8Cdpr6dJWdakTie8bvgkbftvPiYnlf1nFXm4YqURw-4ZDxBH3T29_IrQQKQ
Message-ID: <CAAVpQUBy2Ws8iuvv4WBBcCHQkkQLL5E2Nu=_dnvxR=ehN6gXkg@mail.gmail.com>
Subject: Re: [PATCH v1] vxcan: Support per-netns device unregistration.
To: Oliver Hartkopp <socketcan@hartkopp.net>
Cc: sashiko-reviews@lists.linux.dev, linux-can@vger.kernel.org, 
	Oleksij Rempel <o.rempel@pengutronix.de>, Marc Kleine-Budde <mkl@pengutronix.de>, 
	Vincent Mailhol <mailhol@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 13, 2026 at 9:57=E2=80=AFAM Oliver Hartkopp <socketcan@hartkopp=
.net> wrote:
> On 12.07.26 23:34, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential is=
sue(s) to consider:
> > - [Low] The patch calls the undefined function `unregister_netdevice_qu=
eue_net()`, resulting in a compilation error.
> > --
> >
> > --- Patch [1]: [PATCH v1] vxcan: Support per-netns device unregistratio=
n. ---
> > commit 882fcd31630d9ce6b0a57cc99738c2ad0579763f
> > Author: Kuniyuki Iwashima <kuniyu@google.com>
> >
> > vxcan: Support per-netns device unregistration.
> >
> > This commit updates vxcan_dellink() to unregister local and peer device=
s
> > safely across different namespaces by using xchg(). The change aims to
> > prevent double-queuing of device destruction when RTNL is removed.
> >
> >> diff --git a/drivers/net/can/vxcan.c b/drivers/net/can/vxcan.c
> >> --- a/drivers/net/can/vxcan.c
> >> +++ b/drivers/net/can/vxcan.c
> >
> > [ ... ]
> >
> >> @@ -281,24 +284,25 @@ static int vxcan_newlink(struct net_device *dev,
> >>
> >>   static void vxcan_dellink(struct net_device *dev, struct list_head *=
head)
> >>   {
> >
> > [ ... ]
> >
> >>      unregister_netdevice_queue(dev, head);
> >>
> >> -    if (peer) {
> >> -            priv =3D netdev_priv(peer);
> >> -            RCU_INIT_POINTER(priv->peer, NULL);
> >> -            unregister_netdevice_queue(peer, head);
> >> -    }
> >> +    priv =3D netdev_priv(peer);
> >> +    dev =3D unrcu_pointer(xchg(&priv->peer, NULL));
> >> +    if (dev)
> >> +            unregister_netdevice_queue_net(dev_net(dev), peer, head);
> >
> > [Severity: Low]
> > Is this missing a prerequisite patch? It appears that
> > unregister_netdevice_queue_net() is not defined anywhere in the kernel
> > tree, which leads to a compilation error when building vxcan.c.
>
> The referenced veth.c patch was applied to net-next:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git/commi=
t/?id=3Dd7fda2c776b2a969b9d78c5ad00e30824df43add
>
> where also unregister_netdevice_queue_net() exists.
>
> So this is a net-next resp. can-next patch.

Yes, I meant this is for can-next, but I was not sure how frequently
the tree is synced against net-next and what's the best approach here.
