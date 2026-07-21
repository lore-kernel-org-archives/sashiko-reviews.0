Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009B13358B0
	for <sashiko-reviews@lists.linux.dev>; Tue, 21 Jul 2026 02:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784602199; cv=none; b=nd4B/LksTC6i8hryx+Ldlw0Ms5GCdaFGoUKdXc9wavnUGRupHDYXwZFYNdhmKccJQebBcqHU/vHFDRtkSDkIiHgF1mgT7Ivyvz7KEwb6+WZNTC6vOGxWolUTBMrOW4yG7VRW2Y2YsNhej9PXsxDlbyB11ToQuZvgSUvg1iuIrKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784602199; c=relaxed/simple;
	bh=ZTk5rhIF567UxO2RIeHf5d6KrFWbklZpuu87kvQyo4Q=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:Mime-Version:
	 References:In-Reply-To; b=Xn+ygf7ORIZlnzuUAItMjtRNlXILR0zhEGhdOwgV6ilMcMJSuGhYWnZ9KAgyzKfPRuibhT0IMGi/ZSU8bdXvaAvixv9uM8YfUEICiKHvgxrm/C7W7kcqCyiQD9rdM8h9eD7TTkpb4LT75/JarHF6CJaJ0F4tftnvPBd6MFxu6mI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=EvjC3DbC; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="EvjC3DbC"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2cad8076b01so129981845ad.2
        for <sashiko-reviews@lists.linux.dev>; Mon, 20 Jul 2026 19:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1784602197; x=1785206997; darn=lists.linux.dev;
        h=in-reply-to:references:content-transfer-encoding:mime-version:from
         :subject:cc:to:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pdwADxcJW40fbVmiM8/1GTPINJSUQekE5I+1TjHTrfY=;
        b=EvjC3DbCmTUkHJpreAObJhrFT+q+JVjNpBHtwX8SVD2cvjJsKKZ31M1CSPCLwovyP4
         BM0LVjqKAyMTtYwmz7rINOanOzeTuC8jVbYmYdURYN55kCXIxI5+WbtIxYepGMv3/Azc
         9KmmpyTeGdSYMLm9bgig9S8BGWqfMHZtB2Rvju77b/eClF4NT5cWL4PVRgZO9VZRe6u8
         OM7VrUTISnk2CMM5CmNXuZNkYIHykh2oBOjmI7ncE8BhbHB1wcu7zxMG3qEyFPesuq5C
         PQSd+2FdmVDeTEBrhrqfb8C1xJuHCfgJ3Jp4sy+xCsRHoKORmXz4q8iwoiVNRXZlVypu
         Ii/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784602197; x=1785206997;
        h=in-reply-to:references:content-transfer-encoding:mime-version:from
         :subject:cc:to:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pdwADxcJW40fbVmiM8/1GTPINJSUQekE5I+1TjHTrfY=;
        b=sRjbg/pDH4HRBfrBJjICtveFGDGEhIwc+qMD/dVYAdsaA/I+56XfZEVa8vW92wbTNb
         FlPrBIrJC0NTEAE7LzFNSUraWjeAGwdfBtFd0kZQ6HbnENwjqX/Hv2raRJeHabFKr1Mk
         eq/jmdE1x8SZ2jaUD18I2ZKx8iYk6QFlYUWPcGfu5wlmAN3tKW9PKEhPTpjuq2dSZXAh
         5rl3goR58EhxZ47RzFaSoBHDY+NTLtxRFiPXuRdibsCnDw8GT6ib7D11MTzMNp+cebeu
         3Bu872Zivb6RnjZ8wZgY468lUJLeshKH7LuA4K/9LU2RMpH4McbraMKfX2TlQuW45T0C
         xlqQ==
X-Gm-Message-State: AOJu0YykIkqNMEK3fdru/QqfMkh/Kjfma4NWHg+mK0ryDrq3yy52WBAZ
	N8AU41klAAtto8qgVz0o5jcLWsiFykS8yRZ587mg/YpPefDnpAiP/9iceYV3JTeKQ9RGCNWmHsj
	d6XNG/mQ=
X-Gm-Gg: AfdE7ckbPNzrsLsIFUZHb5xb7pe4cDOhXiRbvt6PY24quYZeP9zyvLmKWwUYSbGgoSQ
	15xUSP+1E3r87x9ugeoA7zObdi3g0zYc6jCq5vx8DqURDMu1HUQMqAPe8PYL7zhRyRNz45urTsx
	8N8nGdGe4kixjZkahXKAOAND5xUMsyuvkoz35R4noZN0Z2tmIm4dh0lFWvkyWFq24lAybDwjmZq
	D4PQJyk7jZv+HWNrYRP7MSpHNexyC4zlJNddtzshi+tQdlaJIwMi8wn/9VtO9uB3aFgYm3d9Hzg
	kNlTSFNgh6AGDWiq0FUKNPNp+vncGu77886wOB3QI+w9ozJgPbt2v5+k+K0ukOlFlSRTcEYafTi
	p5DD2GL86702uTnJbdSZsIsYMfIR1RSQdIEDvFxI+jcf5FxGFwLFCeK1lxoKe9GfrpI1IVWjU8J
	mX6aHXjpLn1Qkq
X-Received: by 2002:a05:6a21:a87:b0:3aa:c964:3c27 with SMTP id adf61e73a8af0-3c3ad95882bmr17807656637.46.1784602197101;
        Mon, 20 Jul 2026 19:49:57 -0700 (PDT)
Received: from localhost ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce29c2c93sm38319020c88.3.2026.07.20.19.49.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 19:49:56 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Mon, 20 Jul 2026 19:49:55 -0700
Message-Id: <DK3WOIUHGKID.2Z9CVA836F6PE@nexthop.ai>
To: <sashiko-reviews@lists.linux.dev>, "Abdurrahman Hussain"
 <abdurrahman@nexthop.ai>
Cc: <robh@kernel.org>, <conor+dt@kernel.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH RFC 1/4] of: incrementally update /aliases lookup on
 reconfig notifications
From: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.21.0
References: <20260720-nh-of-alias-overlay-v1-0-f1e5d9889b30@nexthop.ai>
 <20260720-nh-of-alias-overlay-v1-1-f1e5d9889b30@nexthop.ai>
 <20260720071742.3F3D11F00A3A@smtp.kernel.org>
In-Reply-To: <20260720071742.3F3D11F00A3A@smtp.kernel.org>

On Mon Jul 20, 2026 at 12:17 AM PDT, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 9 potential issu=
e(s) to consider:
>
> New issues:
> - [Critical] Unconditional dereference of `rd->old_prop` on OF_RECONFIG_U=
PDATE_PROPERTY causes a NULL pointer panic.
> - [Critical] OF_RECONFIG_DETACH_NODE fails to remove dynamically allocate=
d aliases, leading to a Memory Leak and Use-After-Free.
> - [High] Lockless modification of the global `aliases_lookup` list causes=
 data races and memory corruption.
> - [High] Updating a boot-time alias creates duplicate entries mapping to =
the same ID, causing driver resource conflicts.
> - [Medium] OF_RECONFIG_ATTACH_NODE fails to scan the node's properties, s=
ilently ignoring aliases added in a newly attached /aliases node.
> - [Medium] The global `of_aliases` pointer mismanages node reference coun=
ting, causing leaks and weak references.
> - [Low] The struct alias_prop::owned documentation contains factually inc=
orrect and misleading claims regarding memory ownership.
>
> Pre-existing issues:
> - [Critical] Creating an alias from an empty property causes a NULL point=
er dereference in of_find_node_by_path().
> - [High] The alias parsing loop contains a 1-byte out-of-bounds read if t=
he property name is an empty string.
> --
>
> --- Patch [1]: [PATCH RFC 1/4] of: incrementally update /aliases lookup o=
n reconfig notifications ---
> commit 172d1d81baebcd7bb4e961520fc11e6b4eadbc38
> Author: Abdurrahman Hussain <abdurrahman@nexthop.ai>
>
> of: incrementally update /aliases lookup on reconfig notifications
>
> This commit registers an OF reconfig notifier to mirror changes in the
> /aliases node into the global aliases_lookup list. It extracts the alias
> parsing logic into a common function and tracks whether entries are stati=
cally
> or dynamically allocated. This ensures aliases defined in overlays are
> correctly resolved by drivers.
>
> Link: https://lore.kernel.org/lkml/1435675876-2159-1-git-send-email-geert=
+renesas@glider.be/
> Link: https://lore.kernel.org/lkml/20150630172131.D4E6CC4041A@trevor.secr=
etlab.ca/
> Link: https://lore.kernel.org/lkml/1435675876-2159-2-git-send-email-geert=
+renesas@glider.be/
> Link: https://lore.kernel.org/lkml/1435675876-2159-3-git-send-email-geert=
+renesas@glider.be/
> Link: https://lore.kernel.org/lkml/1435675876-2159-4-git-send-email-geert=
+renesas@glider.be/
>
>> diff --git a/drivers/of/base.c b/drivers/of/base.c
>> index 6e7a42dedad3f..d516523a71d5e 100644
>> --- a/drivers/of/base.c
>> +++ b/drivers/of/base.c
>
> [ ... ]
>
>> @@ -1915,6 +1915,152 @@ static void of_alias_add(struct alias_prop *ap, =
struct device_node *np,
>> +/*
>> + * Build an alias_prop for @pp using @dt_alloc as the storage allocator
>> + * and add it to aliases_lookup. @owned is stored on the entry so the
>> + * matching destroy path knows whether the alias_prop is a kmalloc'd
>> + * struct that must be kfree()d (with a paired of_node_put on the
>> + * target) or a memblock/dt_alloc'd struct that must be left alone.
>> + *
>> + * Pseudo-properties (name, phandle, ...) and alias names not ending in
>> + * a numeric id are silently skipped.
>> + */
>> +static void of_alias_create(const struct property *pp,
>> +			    void *(*dt_alloc)(u64 size, u64 align),
>> +			    bool owned)
>> +{
>> +	const char *start =3D pp->name;
>> +	const char *end =3D start + strlen(start);
>> +	struct device_node *np;
>> +	struct alias_prop *ap;
>> +	int id, len;
>> +
>> +	if (is_pseudo_property(pp->name))
>> +		return;
>> +
>> +	np =3D of_find_node_by_path(pp->value);
>
> [Severity: Critical]
> This is a pre-existing issue, but does this cause a NULL pointer
> dereference if the property is empty?
>
> If an overlay or boot DT defines a property in /aliases with no value,
> pp->value is NULL. Since of_alias_create() passes pp->value directly to
> of_find_node_by_path(), which passes it to strchr(), will this crash?
>
>> +	if (!np)
>> +		return;
>> +
>> +	while (isdigit(*(end - 1)) && end > start)
>> +		end--;
>
> [Severity: High]
> This isn't a bug introduced by this patch, but does the loop condition
> cause an out-of-bounds read if the property name is an empty string?
>
> If start is empty, end equals start. The loop evaluates isdigit(*(end - 1=
))
> before verifying end > start, causing an immediate read of the memory byt=
e
> preceding the buffer.
>
>> +	len =3D end - start;
>
> [ ... ]
>
>> +static void of_alias_destroy(const char *name)
>> +{
>> +	struct alias_prop *ap, *tmp;
>> +
>> +	list_for_each_entry_safe(ap, tmp, &aliases_lookup, link) {
>> +		if (!ap->owned || strcmp(ap->alias, name) !=3D 0)
>> +			continue;
>
> [Severity: High]
> If an overlay modifies the target of an existing boot-time alias, will
> skipping the destruction of boot-time entries leave duplicate entries in
> the list?
>
> Since this skips entries where owned is false, the old boot-time alias
> remains in aliases_lookup alongside the newly created overlay alias.
> When of_alias_get_id() searches the list, could it return the same ID for
> both devices?
>
>> +		list_del(&ap->link);
>> +		of_node_put(ap->np);
>> +		kfree(ap);
>> +		return;
>> +	}
>> +}
>
> [ ... ]
>
>> +static int of_aliases_reconfig_notifier(struct notifier_block *nb,
>> +					unsigned long action, void *arg)
>> +{
>> +	struct of_reconfig_data *rd =3D arg;
>> +
>> +	/*
>> +	 * Match /aliases structurally (name + root-parent) rather than by
>> +	 * pointer against the of_aliases global =E2=80=94 a system with no
>> +	 * boot-time /aliases (of_aliases =3D=3D NULL) can still acquire one
>> +	 * from an overlay, and we must track its properties from the
>> +	 * first ATTACH_NODE onward.
>> +	 */
>> +	if (!rd->dn || !rd->dn->parent ||
>> +	    !of_node_is_root(rd->dn->parent) ||
>> +	    !of_node_name_eq(rd->dn, "aliases"))
>> +		return NOTIFY_DONE;
>> +
>> +	switch (action) {
>> +	case OF_RECONFIG_ATTACH_NODE:
>> +		if (!of_aliases)
>> +			of_aliases =3D rd->dn;
>
> [Severity: Medium]
> Does assigning of_aliases here create a weak reference?
>
> During boot-time scanning, of_alias_scan() acquires of_aliases with an
> incremented reference count. Here, it is assigned without calling
> of_node_get().
>
> [Severity: Medium]
> Also, if the system started without a boot-time /aliases node, does
> attaching one fail to parse its properties?
>
> Since this handler updates the of_aliases pointer but misses the
> for_each_property_of_node() loop to actually create the aliases, it seems
> the aliases in a newly attached node are silently ignored.
>
>> +		break;
>> +	case OF_RECONFIG_DETACH_NODE:
>> +		if (of_aliases =3D=3D rd->dn)
>> +			of_aliases =3D NULL;
>
> [Severity: Medium]
> Does clearing the pointer here cause a reference leak since of_node_put()
> is omitted?
>
> [Severity: Critical]
> Additionally, does skipping the removal of the dynamic aliases cause a
> memory leak and use-after-free?
>
> The DETACH_NODE handler clears the of_aliases pointer but skips removing
> the corresponding alias_prop entries from aliases_lookup. When the detach=
ed
> node and its properties are later freed, dangling entries will remain in
> the global list. A subsequent alias update could iterate the list and cal=
l
> strcmp() on freed pointer strings.
>
>> +		break;
>> +	case OF_RECONFIG_ADD_PROPERTY:
>> +		of_alias_create(rd->prop, alias_alloc, true);
>
> [Severity: High]
> Is it safe to modify aliases_lookup locklessly here?
>
> The notifier processes dynamic changes and calls into of_alias_create()
> which uses list_add_tail() on the global aliases_lookup list. OF reconfig
> notifiers are intentionally executed after of_mutex has been unlocked, su=
ch
> as in __of_changeset_apply_notify().
>
> Could this race against other writers, or against driver probes calling
> of_alias_get_id() which iterates the list expecting it to be protected by
> of_mutex?
>
>> +		break;
>> +	case OF_RECONFIG_REMOVE_PROPERTY:
>> +		of_alias_destroy(rd->prop->name);
>> +		break;
>> +	case OF_RECONFIG_UPDATE_PROPERTY:
>> +		of_alias_destroy(rd->old_prop->name);
>
> [Severity: Critical]
> Can rd->old_prop be NULL here?
>
> The of_update_property() API allows adding a property if it does not
> already exist, and emits an OF_RECONFIG_UPDATE_PROPERTY event with
> old_prop set to NULL. Would unconditionally dereferencing
> rd->old_prop->name cause a panic in this scenario?
>
>> +		of_alias_create(rd->prop, alias_alloc, true);
>> +		break;
>> +	default:
>> +		break;
>> +	}
>> +	return NOTIFY_OK;
>> +}
>
> [ ... ]
>
>> diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
>> index 0ae16da066e2c..9d16765ae2c3f 100644
>> --- a/drivers/of/of_private.h
>> +++ b/drivers/of/of_private.h
>> @@ -17,6 +17,12 @@
>>   * @alias:	Alias property name
>>   * @np:		Pointer to device_node that the alias stands for
>>   * @id:		Index value from end of alias name
>> + * @owned:	True if @alias was kstrdup'd and @np was of_node_get'd on
>> + *		insertion (overlay-time entries). False for entries built
>> + *		by of_alias_scan() at boot, where @alias points into the
>> + *		FDT and @np is an unreferenced pointer. The removal path
>> + *		uses this flag to decide whether it must kfree(@alias),
>> + *		of_node_put(@np), and kfree(the struct itself).
>
> [Severity: Low]
> Does this documentation accurately reflect the implementation?
>
> The comment claims @alias is kstrdup'd on insertion and kfree'd on
> removal. However, the code merely stores the pp->name pointer directly
> and never calls kfree() on the alias string. It also mentions np is
> unreferenced at boot time, but of_find_node_by_path() does take a
> reference.

Good feedback! Will address in v2.

Thanks,
Abdurrahman
