Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794289495;
	b=rRaVT/FkcYTNMe0xD9k+w6hCfg2gMZ3eFsoaB25sEN14A+Z7RrL9LIfwruSRACzNFYso
	 7VOuVhkpTqrfiT5bYebfpIVHxQfLtBTaT0/PN0fqGMM1MzgoxhcPVATz5GKJ6mS25J3Kb
	 g8IVr05TtcKE/pqmQsNPl+51pd23dcbIQ/v2ZXbEknpW6PKDva6K/x9+Q9suQSYLPfbdK
	 b7vSO7xeSaR/1Ds6vZl+/bCOkF6PxsZZB/pKakyRZKu5B1rlB/ySvcAIeqTfFPpR/72U8
	 n9RiFhDCe7XdfrWOfvbDxn5vcAnhl2K4KWv1omxb4C6SdbCDleeg89e2tXCsSlPZeQQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794289495;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=g39QjZX8zY3AOOtpXk7OF2YWb6Q3Y2gF3RAt0e8I4Pk=;
	b=0Ce3sqWsOzeYge0wizdxj8GF/V0vSjUb8mmrkyyhhkt+mKkXVdIoOSOSbss9eZwaorCz
	 BBQsac4aizTgni7P9KpfD0Sx9fAlAflJkpBSVgrYurCcEt3JK0v9cNtRnluhegusxZSrW
	 EnMEF+LxtlyYrFx+fQGEmNMxJF/f0V81D+OmT6ZpwdQsLk5i7+leN98VLKTWnoIWEMWEQ
	 MJTim/IJwU37wZDrctO0Qgzp6q6hPt/0jiEgdUCAwy/8F7YtMqj5tvgOWZzXinKkTxiBM
	 RQwXoQSswYZ4+7qYqJJWn2gPglUkZhB9Rf7HkERdZ3J0i2do0f4Iih+Ncf7Z97juJGg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="RpwUxM/O";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38440606A31C
	for <sashiko-reviews@lists.linux.dev>; Tue, 10 Nov 2026 05:44:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38440606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RpwUxM/O
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3700ed8dbe3so2289200eec.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 09 Nov 2026 21:44:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794289494; cv=none;
        d=google.com; s=arc-20260327;
        b=UNj9ldnEEFLuD4YaBRW6pN/qguXcTSBsEruTu+CYBonAREIMKHuNmW7wOovajpUbhR
         yyPHwHTvZz2uwyvzwm9CoyP4SzHkSWho3GE2VKFnz0vHv373tj9n1s+f4ofOuVfb6MWp
         tf0bFDoepV6pTkaumP37IJ7JaXduPA+MsWJpSCssdNtVbiRtzk/z1qw+J/izBMn6DgGW
         P5CiBPrwgbcayvVF5b9x4PvC4tLDbN4r1bGqtvVooy7StnalPNLPvwIk9916cO/CFubx
         +Z0DLukEeDfu4EU/mTWqp6gZSLMtQwHkPndO75BzDKBf2QctLkMla3cpGznqx3hBpPNo
         sMLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g39QjZX8zY3AOOtpXk7OF2YWb6Q3Y2gF3RAt0e8I4Pk=;
        fh=/XafWwXInU6xSAMitUKTVJtcnn7zkW/jx5Qszu7SSug=;
        b=ZeeH6bSIQah9zd50XWrjhv0AFuO4lqPQySzh/XZT6qZtZLI7t+0dNBQfc7NIXVKXud
         wGtH8xwozA2vjSIXp1+8MM+HThm62ofm18r2Zsoxmpl7x0FLfErgWboGpUb3/Yc2kPZk
         cJ9Wm/btKmqOY5nVp29goXATy5BCCKrNpUjFn7/eptimT3gzxNsx3cyUKlntdACbYss4
         W5zMj4Kx/7rotv99EAiymWcM4BWhnXGwd/O+aGQJ/ShgXKM8OVUVqhQoiRYUAwDRy1yI
         b9h7wxqet0TzpafszpVuFaa4YDWFetVAF7vBYuhkxuE5Ps6R8VN01qqMrMUg4c3V9hbY
         9Zzg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794289494; x=1794894294; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g39QjZX8zY3AOOtpXk7OF2YWb6Q3Y2gF3RAt0e8I4Pk=;
        b=RpwUxM/OBUUa0t2D9iOz1rAjM9u9j8pkq/CDw5ZJkskVIyZ7bDepeTNblgBo2KsK+o
         Yx7w0WaxM3Z5FqeMs2CoQvBJPbZgYdmkyistDqEmUH5AesVgxhuGhCokMIbkLQzuHhh1
         4q58NzKl0N/u2b4+lIW/sqZ36fd77ZRoqYgyIz96IaeOWQZZdgAFt2uX47RnB8AWc0p5
         iDLQLVzbW1gWXNRmdRq1pz1XXEQoRMBVfrA2UY8SFcpye5CF9mE9XdrLGdFTmKNwiTmV
         w5SUxV+x0s8AWPbDj83tJYX9BACOW/FNV2D/Vap5mB6ek4gDiZD3pJHZAb3iH/VikzIv
         C2Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794289494; x=1794894294;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g39QjZX8zY3AOOtpXk7OF2YWb6Q3Y2gF3RAt0e8I4Pk=;
        b=KYIys458yg58DvmeQj+kFGP39tBqsWK9BNridWj3xjMR2YVCGJv2PezTpj2PUS5+TE
         pmqHZF73ME1KnfXoKgBPNX4B/EGgNFKa46U67wF6MV7bhTUYrLakFaA0pcs0g5P3xNOT
         q/NM0OE55uHGwZM7UHSbihH6O4dC9G3t3r+fXmEZT1j+vRfHESI45HhWGkJ5OkGpR6v9
         c2FLtctywpOmIiWiZ5ezOX3cOztbJ7BKAq+V0yStXiZ+7PQ+h+zTjA12eQFnJ4ME4Evc
         BEMf5H1m67YcDcXsW+XUKA0ijTk7xcYTR+geiQ2p5Jc1t7+LEeEEonS0DDj7ZOOeXysb
         6Mbw==
X-Gm-Message-State: APuU4Z+8hPbsREzsJOluqi3lANGMWlTuvQo0g6tnwJG895oNdXfaEu99
	s8hiMXTiTcIr2+E9z4x3NGcH0iZ4yRyqM1kTaqwv6zuohm3S8iC3Igg49egsVa40a13t4lUB5YR
	oxf7tthG90JHcZXMgzc/VaoRk4sx0OcvhFOcJVfs=
X-Gm-Gg: AYBFou0RcysuXn5Jh3m4VZWHEpHYwTHHenpMQJcT32tO+Ra94/BZLbcDfPXWfV3aAXx
	J8yEMFFj0mQB1mdSpDFdpS3dZZ8HWQyn8uWSkiuUfF/s5nx76EGADele/ZahuRnnjPK5fzASaf2
	PR7vDs0uRLCPc2JMrkyJ6kPC7iKZV8zm3QUzgfbvb733V+9179LHSoqm2NbWsE0GbbGKZP1CPdG
	JsOT+uFiZCWS1uXNHAXcoiog7AvhK2/nuFUjY01X1kPzZjPRPrCHTgb3sVgfDGQi6i3LBKtIHBw
	Qp6nPrUC+NRJ0PrNdLSSJddv09wbv11F+sZoA4zxOzgEJ9s4V99ysDi3YXFwHT07lYFsPFQP6Oe
	ilfHHAk30xwDho4KAfFOQDHFF5UbPAa6aDKORdb4Cbyibnp79wdb+/DlGPNdU0548G9nn
X-Received: by 2002:a05:693c:6384:10b0:369:f05d:6c5c with SMTP id
 5a478bee46e88-3751f467bcamr2356563eec.28.1794289493975; Mon, 09 Nov 2026
 21:44:53 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261108134001.536207-1-hj351016@gmail.com> <sashiko-outbox-203786@kernel.org>
In-Reply-To: <sashiko-outbox-203786@kernel.org>
From: khj <hj351016@gmail.com>
Date: Tue, 10 Nov 2026 14:44:42 +0900
X-Gm-Features: AclHuK83zmSBicAkhGXR_nnbiD7uLYv-Y5HwVWYFh-U9eG4xV_6xhYX0d6KFHCc
Message-ID: <CAGr5VtOWtjDFraii2qMu20=_mePfjFUwMU_dhnGm7aiw6QTwUQ@mail.gmail.com>
Subject: Re: [PATCH] usb: phy: cancel charger work in usb_remove_phy() to
 avoid use-after-free
To: sashiko-reviews@lists.linux.dev
Cc: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks, both are valid.

You're right that cancel_work_sync() alone doesn't fully close this: the
extcon type_nb notifier reaches the usb_phy via container_of() (not the
phy_list), so an extcon event can re-queue chg_work after the cancel, and
for providers that free the containing struct in .remove() the devm extcon
notifiers are torn down only later (at the provider's devres), after the
struct is already gone.

This patch is a partial mitigation of the chg_work window; the complete
fix is an architectural one for the usb_phy framework lifetime -- the
notifiers would need to be unregistered symmetrically before the work is
drained in usb_remove_phy(), and more fundamentally struct usb_phy is
devm-allocated yet handed to consumers via usb_get_phy()/get_device(), so
a consumer holding a reference can still use it after the provider's devres
frees it (the Critical you point to). That wants proper get/put refcounting
of the usb_phy rather than devm, which affects every USB PHY provider.

I'd rather not fold a core-framework lifetime rework into this one-line
teardown fix and risk regressing every PHY driver. Happy to take this
either way you prefer: keep this as the incremental chg_work fix and do the
notifier-unregister + refcount rework as a separate series, or drop this in
favour of that series. What would you like?

Thanks,
Hyunjung

2026=EB=85=84 11=EC=9B=94 8=EC=9D=BC (=EC=9D=BC) =EC=98=A4=ED=9B=84 10:50, =
<sashiko-bot@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] usb: phy: chg_work re-queued after cancel_work_sync() in
>   usb_remove_phy()
> It also noticed 1 related pre-existing issue this patch does not
> introduce:
> - [Critical] usb: phy: use-after-free in usb_get_phy() [1]
> --
>
> commit 4a4ffa5316b9cec2015871ada70b2fe24ed654b1
> Author: Hyunjung Ko <hj351016@gmail.com>
>
> usb: phy: cancel charger work in usb_remove_phy() to avoid use-after-free
>
> This commit calls cancel_work_sync(&x->chg_work) in usb_remove_phy() afte=
r
> removing the PHY from phy_list so pending charger notification work finis=
hes
> before the usb_phy is freed.
>
> > diff --git a/drivers/usb/phy/phy.c b/drivers/usb/phy/phy.c
> > index 5a9b9353f343d..caae74988fd95 100644
> > --- a/drivers/usb/phy/phy.c
> > +++ b/drivers/usb/phy/phy.c
> > @@ -731,6 +731,15 @@ void usb_remove_phy(struct usb_phy *x)
> >       if (x)
> >               list_del(&x->head);
> >       spin_unlock_irqrestore(&phy_lock, flags);
> > +
> > +     /*
> > +      * The charger-notify work, scheduled from usb_phy_set_charger_*(=
)
> > +      * and the charger-type detection, dereferences the usb_phy. The =
PHY
> > +      * is now off the lookup list, so no new work can be queued; drai=
n any
> > +      * work still pending before the caller frees the usb_phy.
> > +      */
> > +     if (x)
> > +             cancel_work_sync(&x->chg_work);
> >  }
>
> [Severity: Medium]
> Can x->chg_work still be re-queued after cancel_work_sync(&x->chg_work)
> returns?
>
> Removing x from phy_list does not stop extcon charger notifications,
> because usb_add_extcon() registers x->type_nb on x->edev via
> devm_extcon_register_notifier(), and usb_phy_get_charger_type() obtains
> the struct usb_phy with container_of(nb, struct usb_phy, type_nb) rather
> than looking it up in phy_list:
>
> drivers/usb/phy/phy.c:usb_phy_get_charger_type() {
>         struct usb_phy *usb_phy =3D container_of(nb, struct usb_phy, type=
_nb);
>
>         __usb_phy_get_charger_type(usb_phy);
>         return NOTIFY_OK;
> }
>
> PHY drivers call usb_remove_phy() from their .remove() callback before
> devres_release_all() unregisters x->type_nb (and fsl_otg_remove() calls
> kfree(fsl_otg_dev) immediately after usb_remove_phy()):
>
> CPU0                              CPU1
> fsl_otg_remove()
>   usb_remove_phy(&fsl_otg_dev->phy)
>     list_del(&x->head)
>     cancel_work_sync(&x->chg_work)
>                                   usb_phy_get_charger_type()
>                                     __usb_phy_get_charger_type()
>                                       schedule_work(&usb_phy->chg_work)
>   kfree(fsl_otg_dev)
>                                   usb_phy_notify_charger_work()
>                                     usb_phy->chg_state ... <-- use-after-=
free
>
> Unregistering the extcon notifiers in usb_remove_phy() before calling
> cancel_work_sync(&x->chg_work) would prevent extcon events from
> re-scheduling the work.
>
> [Severity: Critical]
> This problem wasn't introduced by this patch, but can a consumer holding =
a
> reference from usb_get_phy() [1] still trigger a use-after-free on
> struct usb_phy when the PHY provider unbinds?
>
> usb_get_phy() pins phy->dev with get_device(phy->dev) under phy_lock:
>
> drivers/usb/phy/phy.c:usb_get_phy() {
>         ...
>         phy =3D __usb_find_phy(&phy_list, type);
>         if (IS_ERR(phy) || !try_module_get(phy->dev->driver->owner)) {
>                 ...
>                 goto err0;
>         }
>
>         get_device(phy->dev);
> }
>
> However, most PHY drivers allocate the structure embedding struct usb_phy
> with devm_kzalloc() during probe.  When the provider driver unbinds,
> usb_remove_phy() removes the PHY from phy_list and devres_release_all()
> frees the devm-allocated struct usb_phy even though the consumer still
> holds get_device(phy->dev).  Any later call by that consumer (such as
> usb_phy_set_charger_current(), PHY callbacks, or usb_put_phy()) then
> dereferences freed memory.
>
> [1] https://sashiko.dev/#/bug/linux-7f476623-2458-498a-85ca-75ee73ec5f0c
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261108134001.53=
6207-1-hj351016@gmail.com?part=3D1
