Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F819384CF2
	for <sashiko-reviews@lists.linux.dev>; Thu,  3 Sep 2026 23:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788477099; cv=none; b=noj2yqEvFXmFSmK6w3p9VY8CXaTxO40Oj3B4BzVha2DsEt08yJj2rTQNkKVxElhYgGK1BnhK8gqj0dPwyfc1hZ2m1WUHF18wvOKSfPmBF0QlgkjaqGGOFN8FnXQJv/HXW7vxXwn9GRHND43gzqkyTia7YK8cKW//aM4OPdcfElE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788477099; c=relaxed/simple;
	bh=EuDeJM9Gleqr3obuv78xc9tu4WIz5KvR7h3hBO9Qgl4=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:Mime-Version:
	 References:In-Reply-To; b=sMptdDapkU57PBFvVgLsoNX8hcSEluZsAVwiJPCZYu+4QoiKtiK7tHytqIioE+QBvETtHnIIWRDfHgeIOLa+3SIX9/OOOXTIeSGeR+LkluylFyW3azY77t4Fio+r7rMJLp6aFByLQpv1ocz/vinI+/05T0gKHLaXusKQBhjKFd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=Vg9DD1k/; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="Vg9DD1k/"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3965d3d9ab8so265472a91.3
        for <sashiko-reviews@lists.linux.dev>; Thu, 03 Sep 2026 16:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1788477097; x=1789081897; darn=lists.linux.dev;
        h=in-reply-to:references:content-transfer-encoding:mime-version:cc:to
         :from:subject:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QpcDzHKvUQr8nZ3HzzAN+drcJ/2pYiQIPhzCxczuZ7E=;
        b=Vg9DD1k/ghuKptTOr4RIp4CP1OCY+pMZOBTP+JQ9LzRREKQTuIFfjHjkNAZvlkOeju
         /oIlZnjwZSDlu5Jc/xGpbOcdRbK04J/m82ZBWcDlekoGlhmcQeNA3ugnzOj8j8AWw2ZV
         eeOhg1+jLCVRP6RTN+++riq/ItGYmpMlm9EqEJuEZ38iQcpYmOTi0Uwwp7XNq4vZylSG
         WbQNjtiUMRAYhrLiAtGc80DciFv/oWZwBaHqeETtDgAWAJOkN2esJeQ47t8DSmABDzOl
         16lWEXdxHz4ZPMPOziDZK5Vk1nmHSe8egLELgmLLFtud+FHkHAPTsTuf6cWq5W9edV0J
         jJmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788477097; x=1789081897;
        h=in-reply-to:references:content-transfer-encoding:mime-version:cc:to
         :from:subject:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QpcDzHKvUQr8nZ3HzzAN+drcJ/2pYiQIPhzCxczuZ7E=;
        b=oK+OBiLWRa6sz4Lo9uhvmwVJOOA0C28Zu2cUsLsgVV+8tTEOk5b077dW1M7/2nwNFd
         fMaIm5qA4IBcKFm5Ft7iL1+ccBk1+lG/BKfNMfzLe04MedVVRY8RXRmejrsnT/1UjmY4
         lX9r7U0y5sKndyBAsZcCTf+3JbqTQhaadKtEwH3JAlWnrcrzv7gt0IVgHoGN9xmLR86f
         MX1kDh0QaQxKM1sC+7mg/t4xDO/CLMNx+IKW7a1D1wgmP0YK1JFdLSLXIPI+rBNCdu7y
         HA7WTV+IeycdDek1BHJel3NqnjBGzhAbSoBeP6ep8EJsVGLUJPaQTt5a+rKfy4hXKGRf
         HiGg==
X-Gm-Message-State: AFuF++l6nNKu9k+xQv0Zrud9flcWYx+YvY/wQFjesNmg5R74xfbk8azE
	1sdo0wXsg6s/S9IYh8L07W/QfVJW5IItyDb7M7S6+lHX2B7JDDS4b8yKJ3HfivqnTzqkK7IDlwX
	0yIncOks=
X-Gm-Gg: AYBFou3f2bzx6Lj1wO/UM7hdbjQmyTOLRNBXnc31uNkevmAKFtelOxXSHn5vB7yCNeR
	AB1aoqI+qTCqBmVOvjteqVchzhH5nMBWI0ML3PONceYhh5v+dhRk0joGiQWe8TO1q+U1deRviYf
	7LIJXTOGr0/0859Y2dRROR3HaT6KW3JgxGxH+QGfe0A4fW3rcDIg60Zcq7DFUA0fT4BqtlNh2eT
	i9kmpVm2DgQVwqbP8xqQDZPKkY1c6iHVNIm3fMWR0Xh8GVkXt4kR70dMf1Ac/zOvWo+9kygAC5+
	yBT6ZyMPQ7eNSGP1iTSxtCbC22BTdy7kLVGxR88rs0IQl18OHIRiGP5QpRu4a//3G/XnGs4Rsxy
	DKgEcn4Sb+f9wltROVdoi9HR+cOHkQ9h+ag35gLheXjoNEwg6rhzf2MUFZkqr2k2H86EAx6lrHt
	yRNL1RKZIoUpO68FLaqGfZYs25L2/gMcH+m/KZs15JFOsLCAjyuqq3O2Bub72L
X-Received: by 2002:a17:90b:3d89:b0:396:5fce:8e24 with SMTP id 98e67ed59e1d1-39b260d2ea8mr2655024a91.4.1788477097408;
        Thu, 03 Sep 2026 16:11:37 -0700 (PDT)
Received: from localhost ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b8f44d7sm1893309eec.22.2026.09.03.16.11.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 16:11:36 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Thu, 03 Sep 2026 16:11:35 -0700
Message-Id: <DL627V92FSCZ.2Y9QLHRJJWO2@nexthop.ai>
Subject: Re: [PATCH v7 05/10] of/overlay: only treat a positive changeset id
 as registered
From: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
To: <sashiko-reviews@lists.linux.dev>, "Abdurrahman Hussain"
 <abdurrahman@nexthop.ai>
Cc: <robh@kernel.org>, <conor+dt@kernel.org>, <devicetree@vger.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.21.0
References: <20260831-nh-of-alias-overlay-v7-0-02754604805a@nexthop.ai>
 <20260831-nh-of-alias-overlay-v7-5-02754604805a@nexthop.ai>
 <20260901014554.83A8D1F000E9@smtp.kernel.org>
In-Reply-To: <20260901014554.83A8D1F000E9@smtp.kernel.org>

On Mon Aug 31, 2026 at 6:45 PM PDT, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] In `of_overlay_remove_all()`, passing `&ovcs->id` to `of_overlay=
_remove()` causes a deterministic use-after-free and leaves freed memory in=
 the global `ovcs_list` and `ovcs_idr`.
> - [High] Lockless iteration of `ovcs_list` in `of_overlay_remove_all()` a=
llows concurrent modifications, leading to a Use-After-Free.
> --
>
> commit 5e44e19c9c02429165243b3c23378b30ba40fdd3
> Author: Abdurrahman Hussain <abdurrahman@nexthop.ai>
>
> of/overlay: only treat a positive changeset id as registered
>
> of_overlay_fdt_apply() stores the idr_alloc() return value in
> ovcs->id before checking it. On failure the stored id is negative,
> free_overlay_changeset()'s "if (ovcs->id)" check passes, idr_remove()
> is called with a negative id and list_del() runs on ovcs->ovcs_list,
> which is not initialized until after the id allocation. An allocation
> failure at that point dereferences NULL.
>
>> diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
>> index 08d5351746be6..9b9f198a1d70a 100644
>> --- a/drivers/of/overlay.c
>> +++ b/drivers/of/overlay.c
> [ ... ]
>> @@ -860,7 +860,8 @@ static void free_overlay_changeset(struct overlay_ch=
angeset *ovcs)
>>  	if (ovcs->cset.entries.next)
>>  		of_changeset_destroy(&ovcs->cset);
>> =20
>> -	if (ovcs->id) {
>> +	/* a failed idr_alloc() leaves its negative error in ovcs->id */
>> +	if (ovcs->id > 0) {
>
> [Severity: High]
> This isn't a bug introduced by this patch, but does this check cause a=20
> use-after-free and list corruption when called from of_overlay_remove_all=
()?
>
> In of_overlay_remove_all(), we iterate over the ovcs_list and pass the=20
> address of the internal id field:
>
> drivers/of/overlay.c:of_overlay_remove_all() {
>     list_for_each_entry_safe_reverse(ovcs, ovcs_n, &ovcs_list, ovcs_list)=
 {
>         ret =3D of_overlay_remove(&ovcs->id);
> ...
> }
>
> Inside of_overlay_remove(), it zeros out this ID directly through the poi=
nter=20
> before freeing the changeset:
>
> drivers/of/overlay.c:of_overlay_remove() {
> ...
>     *ovcs_id =3D 0;
> ...
>     free_overlay_changeset(ovcs);
> ...
> }
>
> When free_overlay_changeset() executes, ovcs->id is already 0, so the=20
> if (ovcs->id > 0) condition will evaluate to false. This skips both=20
> idr_remove() and list_del(&ovcs->ovcs_list) before the memory is freed,=
=20
> leaving stale pointers in the active global list and IDR.
>

Confirmed. of_overlay_remove_all() is the one caller that passes
&ovcs->id, so the "*ovcs_id =3D 0" in of_overlay_remove() zeroes
ovcs->id itself before free_overlay_changeset() runs. The
"if (ovcs->id > 0)" guard (previously "if (ovcs->id)") then skips
idr_remove() and list_del(), and the ovcs is kfree()d while still
linked in ovcs_list and registered in ovcs_idr. The next ovcs_list or
ovcs_idr access after that walks freed memory.

Pre-existing =E2=80=94 the ordering dates to 24789c5ce5a3 ("of: overlay:
detect cases where device tree may become corrupt") =E2=80=94 and latent, s=
ince
of_overlay_remove_all() currently has no in-tree callers. Still worth
fixing for module users. The minimal fix is to stop aliasing the
changeset's own field:

      list_for_each_entry_safe_reverse(ovcs, ovcs_n, &ovcs_list, ovcs_list)=
 {
-             ret =3D of_overlay_remove(&ovcs->id);
+             int id =3D ovcs->id;
+
+             ret =3D of_overlay_remove(&id);

Rob, want this as one more patch in this series (it sits right next to
patch 5), or as a separate fix?

>
> [Severity: High]
> This is also a pre-existing issue, but could the lockless iteration in=20
> of_overlay_remove_all() lead to a use-after-free?
>
> The iteration of ovcs_list in of_overlay_remove_all() allows concurrent=
=20
> modifications:
>
> drivers/of/overlay.c:of_overlay_remove_all() {
>     list_for_each_entry_safe_reverse(ovcs, ovcs_n, &ovcs_list, ovcs_list)=
 {
> ...
> }
>
> This iterates the globally shared ovcs_list without holding of_mutex. If=
=20
> another thread concurrently calls of_overlay_remove() on a different over=
lay,=20
> it will acquire of_mutex and remove or free that overlay.
>
> If the freed overlay was concurrently cached as ovcs_n (the 'next' elemen=
t in=20
> the safe iteration), the loop in of_overlay_remove_all() will dereference=
=20
> the freed memory when advancing to the next iteration.
>
>>  		idr_remove(&ovcs_idr, ovcs->id);
>>  		list_del(&ovcs->ovcs_list);
>>  		ovcs->id =3D 0;
>>  	}

Known =E2=80=94 you raised the same walk on v6, and it was deliberately lef=
t
out of this series' scope. It also can't be fixed locally: wrapping
the loop in of_mutex deadlocks against of_overlay_remove() taking
of_mutex itself, so it needs a __of_overlay_remove() split. That is
follow-up material, and equally unreachable in-tree today for the same
no-callers reason.

Thanks,
Abdurrahman
